import 'package:lukerieff/networking/protocol/pb/frame_message.pb.dart';

abstract class Command {
  final int commandNo;

  const Command(this.commandNo);

  Frame_ProtoCmd encode();
}