import 'dart:typed_data';

import 'package:lukerieff/networking/protocol/client/commands/command.dart';
import 'package:lukerieff/networking/protocol/pb/frame_message.pb.dart';

class ClaimChannelCommand extends Command {
  final int channel;
  final Uint8List? body;

  const ClaimChannelCommand(
    super.commandNo,
    this.channel, {
    this.body,
  });

  @override
  Frame_ProtoCmd encode() {
    return Frame_ProtoCmd(
      commandNo: commandNo,
      claimChannel: Frame_ProtoCmd_ClaimChannel(
        channel: channel,
        body: body?.toList(),
      ),
    );
  }
}
