import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';
import 'package:lukerieff/basic_event_emitter.dart';
import 'package:lukerieff/protocol/channel.dart';
import 'package:lukerieff/protocol/channel/protocol_channel_configuration.dart';
import 'package:lukerieff/protocol/client/channels.dart';
import 'package:lukerieff/protocol/client/command_manager.dart';
import 'package:lukerieff/protocol/client/commands/command/claim_channel_command.dart';
import 'package:lukerieff/protocol/client/commands/command.dart';
import 'package:lukerieff/protocol/client/pending_completer_command.dart';
import 'package:lukerieff/protocol/client/protocol_client_configuration.dart';
import 'package:lukerieff/protocol/client/protocol_client_event.dart';
import 'package:lukerieff/protocol/client/protocol_client_frame_reader.dart';
import 'package:lukerieff/protocol/client/protocol_client_state.dart';
import 'package:lukerieff/protocol/client/protocol_client_state_change_event.dart';
import 'package:lukerieff/protocol/client/replies/reply.dart';
import 'package:lukerieff/protocol/messages/frame_messages.pb.dart';

class ProtocolClient extends BasicEventEmitter<ProtocolClientEvent> {
  static final Logger _logger = Logger();

  final ProtocolClientConfiguration configuration;
  final Channels _channels = Channels();
  final CommandManager _commandManager = CommandManager();
  late ProtocolClientFrameReader _frameReader;
  SecureSocket? _secureSocket;
  int _nextCommandNo = 0;
  ProtocolClientState _state = ProtocolClientState.disconnected;

  Timer? _reconnectTimer;

  int get _commandNo {
    return _nextCommandNo++;
  }

  void setState(final ProtocolClientState state) {
    _state = state;
    emit(ProtocolClientStateChangeEvent(state));
  }

  /// Constructs a new client.
  ProtocolClient(
    this.configuration,
  ) {
    _frameReader = ProtocolClientFrameReader(_onFrame);

    _performConnectionAttempt();

    for (final ProtocolChannelConfiguration channelConfiguration
        in configuration.channelConfigurations) {
      final Channel channel = Channel(this, channelConfiguration);
      _channels.add(channel);
    }
  }

  /// Performs a connection attempt.
  Future<void> _performConnectionAttempt() async {
    _logger.d(
        "Attempting to connect to server ${configuration.host}:${configuration.port}"
        " with timeout of ${configuration.connectTimeout}.");

    await Future.delayed(const Duration(milliseconds: 250));

    _reconnectTimer = null;

    try {
      _secureSocket = await SecureSocket.connect(
        configuration.host,
        configuration.port,
        timeout: configuration.connectTimeout,
        onBadCertificate: (_) => true,
      );
    } on SocketException catch (socketException) {
      _logger.e("An socket exception occurred while trying"
          " to connect: ${socketException.message}");

      _secureSocket = null;
      _startReconnectTimer();
      return;
    }

    _logger.d("Connected to ${configuration.host}:${configuration.port}");

    setState(ProtocolClientState.connected);

    _secureSocket!.listen(
      _frameReader.write,
      onError: _onSecureSocketError,
      onDone: _onSecureSocketDone,
    );

    for (final Channel channel in _channels.values) {
      _logger.d("Claiming channel ${channel.configuration.identifier}");

      final Uint8List? claimCommandBody =
          channel.configuration.authentication?.getBodyForClaimCommand();

      final Command command = ClaimChannelCommand(
        _commandNo,
        channel.configuration.identifier,
        body: claimCommandBody,
      );

      final Reply reply = await sendCommand(command);

      if (reply.hasError()) {
        _logger.e("Failed to claim channel ${channel.configuration.identifier},"
            " error: ${reply.error}");
      }
    }
  }

  /// Gets called once the secure socket has an error.
  void _onSecureSocketError(error) {
    _logger.e("The secure socket had an error: $error");

    setState(ProtocolClientState.disconnected);

    _startReconnectTimer();
  }

  /// Gets called once the secure socket is done.
  void _onSecureSocketDone() {
    _logger.d("The secure socket is done.");
    _channels.closeAllDueToConnectionLoss();

    setState(ProtocolClientState.disconnected);

    _startReconnectTimer();
  }

  /// Starts the reconnect timer.
  void _startReconnectTimer() {
    _logger.d("Starting the reconnect timer, reconnecting in "
        "${configuration.reconnectInterval}");

    _reconnectTimer =
        Timer(configuration.reconnectInterval, _performConnectionAttempt);
  }

  /// Handles the reception of a new channeled message.
  void _onChanneledMessage(final FrameChanneledMessage channeledMsg) {
    final Channel? channel = _channels.get(channeledMsg.channel);
    if (channel == null) {
      throw Exception(
          "Cannot forward message to channel ${channeledMsg.channel} because it does not exist!");
    }

    channel.onChanneledMessage(channeledMsg);
  }

  /// handles
  void _onHeartbeatMessage(final FrameHeartbeatMessage heartbeatMsg) {}

  /// Handles the reception of a new proto reply.
  void _onProtoReply(final FrameProtocolReplyMessage protoReplyMessage) {
    final Reply reply = Reply.decode(protoReplyMessage);
    _commandManager.onReply(reply);
  }

  /// Handles the reception of a new frame.
  void _onFrame(final FrameMessage frame) {
    switch (frame.whichChild()) {
      case FrameMessage_Child.channeled:
        _onChanneledMessage(frame.channeled);
        break;
      case FrameMessage_Child.heartbeat:
        _onHeartbeatMessage(frame.heartbeat);
        break;
      case FrameMessage_Child.protoReply:
        _onProtoReply(frame.protoReply);
        break;
      case FrameMessage_Child.notSet:
        break;
      case FrameMessage_Child.protoCmd:
        break;
    }
  }

  /// Constructs the length buffer for a frame.
  Uint8List _computeFrameLengthBuffer(final int length) {
    final ByteData byteData = ByteData(4);

    byteData.setInt32(0, length);

    return byteData.buffer.asUint8List();
  }

  /// Sends the given frame (do not call yourself).
  Future<void> sendFrame(
    final FrameMessage frame, {
    bool flush = true,
  }) async {
    final Uint8List frameBuffer = frame.writeToBuffer();
    final Uint8List frameLengthBuffer =
        _computeFrameLengthBuffer(frameBuffer.length);

    _secureSocket!.add(frameLengthBuffer);
    _secureSocket!.add(frameBuffer);

    if (flush) {
      await _secureSocket!.flush();
    }
  }

  Future<Reply> sendCommand(final Command command) async {
    final pendingCommand = PendingCompleterCommand(command);
    _commandManager.add(pendingCommand);

    await sendFrame(FrameMessage(
      protoCmd: command.encode(),
    ));

    return pendingCommand.future;
  }

  Future<void> destroy() async {
    _logger.d("destroy() called");

    if (_reconnectTimer != null) {
      _logger.d("Cancelling reconnect timer");
      _reconnectTimer!.cancel();
    }

    _logger.d("Closing secure socket");
    await _secureSocket!.close();
  }

  Channel? getChannelByIdentifier(final int identifier) {
    return _channels.get(identifier);
  }
}
