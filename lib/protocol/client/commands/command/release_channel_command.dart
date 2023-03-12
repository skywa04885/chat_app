import 'package:lukerieff/protocol/client/commands/command.dart';
import 'package:lukerieff/protocol/messages/frame_messages.pb.dart';

class ReleaseChannelCommand extends Command {
  final int channel;

  const ReleaseChannelCommand(
    super.commandNo,
    this.channel,
  );

  @override
  FrameProtocolCommandMessage encode() {
    return FrameProtocolCommandMessage(
      commandNo: commandNo,
      releaseChannel: FrameProtocolReleaseChannelCommandMessage(
        channel: channel,
      ),
    );
  }
}
