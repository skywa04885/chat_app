import 'dart:typed_data';

import 'package:lukerieff/protocol/client/commands/command.dart';
import 'package:lukerieff/protocol/messages/frame_messages.pb.dart';

class ClaimChannelCommand extends Command {
  final int channel;
  final Uint8List? body;

  const ClaimChannelCommand(
    super.commandNo,
    this.channel, {
    this.body,
  });

  @override
  FrameProtocolCommandMessage encode() {
    return FrameProtocolCommandMessage(
      commandNo: commandNo,
      claimChannel: FrameProtocolClaimChannelCommandMessage(
        channel: channel,
        body: body?.toList(),
      ),
    );
  }
}
