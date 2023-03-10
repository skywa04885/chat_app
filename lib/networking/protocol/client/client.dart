import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:logger/logger.dart';
import 'package:lukerieff/networking/protocol/channel/channel.dart';
import 'package:lukerieff/networking/protocol/client/channels.dart';
import 'package:lukerieff/networking/protocol/client/command_manager.dart';
import 'package:lukerieff/networking/protocol/client/commands/claim_channel_command.dart';
import 'package:lukerieff/networking/protocol/client/commands/command.dart';
import 'package:lukerieff/networking/protocol/client/frame_reader.dart';
import 'package:lukerieff/networking/protocol/client/pending_completer_command.dart';
import 'package:lukerieff/networking/protocol/client/replies/reply.dart';
import 'package:lukerieff/networking/protocol/client/replies/child/error_reply_child.dart';
import 'package:lukerieff/networking/protocol/client/replies/child/reply_child.dart';
import 'package:lukerieff/networking/protocol/pb/frame_message.pb.dart';

class Client {
  int _nextCommandNo = 0;
  final Logger _logger = Logger();
  final SecureSocket secureSocket;
  final Channels _channels = Channels();
  final CommandManager _commandManager = CommandManager();
  final FrameReader _frameReader = FrameReader();

  int get _commandNo {
    return _nextCommandNo++;
  }

  /// Constructs a new client.
  Client(
    this.secureSocket,
  ) {
    secureSocket.transform(_frameReader).listen(_onFrame);

    _logger.d(
        "Client created on socket towards ${secureSocket.remoteAddress.address}:${secureSocket.remotePort}");
  }

  /// Handles the reception of a new channeled message.
  void _onChanneledMessage(final Frame_Channeled channeledMsg) {
    // Gets the channel, and throws an error if it does not exist.
    final Channel? channel = _channels.get(channeledMsg.channel);
    if (channel == null) {
      throw Exception(
          "Cannot forward message to channel ${channeledMsg.channel} because it does not exist!");
    }

    // Forwards the message.
    channel.onChanneledMessage(channeledMsg);
  }

  /// handles
  void _onHeartbeatMessage(final Frame_Heartbeat heartbeatMsg) {}

  /// Handles the reception of a new proto reply.
  void _onProtoReply(final Frame_ProtoReply protoReplyMessage) {
    final Reply reply = Reply.decode(protoReplyMessage);
    _commandManager.onReply(reply);
  }

  /// Handles the reception of a new frame.
  void _onFrame(final Frame frame) {
    print(frame);
    switch (frame.whichChild()) {
      case Frame_Child.channeled:
        _onChanneledMessage(frame.channeled);
        break;
      case Frame_Child.heartbeat:
        _onHeartbeatMessage(frame.heartbeat);
        break;
      case Frame_Child.protoReply:
        _onProtoReply(frame.protoReply);
        break;
      case Frame_Child.notSet:
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
    final Frame frame, {
    bool flush = true,
  }) async {
    // Constructs the two buffers.
    final Uint8List frameBuffer = frame.writeToBuffer();
    final Uint8List frameLengthBuffer =
        _computeFrameLengthBuffer(frameBuffer.length);

    // Writes the buffers to the client.
    secureSocket.add(frameLengthBuffer);
    secureSocket.add(frameBuffer);

    // Flushes the buffers, if specified.
    if (flush) {
      await secureSocket.flush();
    }
  }

  Future<Reply> sendCommand(final Command command) async {
    final pendingCommand = PendingCompleterCommand(command);
    _commandManager.add(pendingCommand);

    await sendFrame(Frame(
      protoCmd: command.encode(),
    ));

    return pendingCommand.future;
  }

  /// Claims a channel with the given identifier.
  Future<Channel> claimChannel(final int channelIdentifier, {
    Uint8List? body,
  }) async {
    final Command command = ClaimChannelCommand(
      _commandNo,
      channelIdentifier,
      body: body,
    );

    final Reply reply = await sendCommand(command);
    final ReplyChild replyChild = reply.child;

    if (replyChild.runtimeType == ErrorReplyChild) {
      throw Exception(replyChild.toString());
    }

    final Channel channel = Channel(
      this,
      channelIdentifier,
    );

    _channels.add(channel);

    return channel;
  }

  Future<void> destroy() async {
    _logger.d("destroy() called");

    // Closes the secure socket.
    _logger.d("Closing secure socket");
    await secureSocket.close();
  }
}
