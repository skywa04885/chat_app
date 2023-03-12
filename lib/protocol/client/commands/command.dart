import 'package:lukerieff/protocol/messages/frame_messages.pb.dart';

abstract class Command {
  final int commandNo;

  const Command(this.commandNo);

  FrameProtocolCommandMessage encode();
}
