import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:logger/logger.dart';
import 'package:lukerieff/protocol/channel.dart';
import 'package:lukerieff/protocol/client/channels.dart';
import 'package:lukerieff/protocol/client/command_manager.dart';
import 'package:lukerieff/protocol/client/commands/command/claim_channel_command.dart';
import 'package:lukerieff/protocol/client/commands/command.dart';
import 'package:lukerieff/protocol/client/pending_completer_command.dart';
import 'package:lukerieff/protocol/client/protocol_client_configuration.dart';
import 'package:lukerieff/protocol/client/protocol_client_frame_reader.dart';
import 'package:lukerieff/protocol/client/replies/reply.dart';
import 'package:lukerieff/protocol/messages/frame_messages.pb.dart';

class ProtocolClient {
  static final Logger _logger = Logger();

  final ProtocolClientConfiguration configuration;
  final Channels _channels = Channels();
  final CommandManager _commandManager = CommandManager();
  final List<void Function()> _onConnectedCallbacks = [];
  final List<void Function()> _onDisconnectedCallbacks = [];
  late ProtocolClientFrameReader _frameReader;
  SecureSocket? _secureSocket;
  int _nextCommandNo = 0;

  Timer? _reconnectTimer;

  int get _commandNo {
    return _nextCommandNo++;
  }

  /// Constructs a new client.
  ProtocolClient(
    this.configuration,
  ) {
    _frameReader = ProtocolClientFrameReader(_onFrame);

    _performConnectionAttempt();
  }

  void addOnConnectedCallback(final void Function() callback) {
    _onConnectedCallbacks.add(callback);
  }

  void removeOnConnectedCallback(final void Function() callback) {
    _onConnectedCallbacks.remove(callback);
  }

  void addOnDisconnectedCallback(final void Function() callback) {
    _onDisconnectedCallbacks.add(callback);
  }

  void removeOnDisconnectedCallback(final void Function() callback) {
    _onDisconnectedCallbacks.remove(callback);
  }

  /// Performs a connection attempt.
  Future<void> _performConnectionAttempt() async {
    _logger.d(
        "Attempting to connect to server ${configuration.host}:${configuration.port}"
        " with timeout of ${configuration.connectTimeout}.");

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
      _reconnectTimer =
          Timer(configuration.reconnectInterval, _performConnectionAttempt);

      return;
    }

    _logger.d("Connected to ${configuration.host}:${configuration.port}");

    _secureSocket!.listen(
      _frameReader.write,
      onError: _onSecureSocketError,
      onDone: _onSecureSocketDone,
    );
  }

  /// Gets called once the secure socket has an error.
  void _onSecureSocketError(error) {
    _logger.e("The secure socket had an error: $error");
  }

  /// Gets called once the secure socket is done.
  void _onSecureSocketDone() {
    _logger.d("The secure socket is done.");
    _channels.closeAllDueToConnectionLoss();
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

  /// Claims the channel with the given identifier.
  Future<void> claimChannel(
    final int channelIdentifier, {
    Uint8List? body,
  }) async {
    final Command command = ClaimChannelCommand(
      _commandNo,
      channelIdentifier,
      body: body,
    );

    final Reply reply = await sendCommand(command);
    if (reply.hasError()) {
      throw reply.error!;
    }

    final Channel channel = Channel(this, channelIdentifier);
    _channels.add(channel);
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
}
