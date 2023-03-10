import 'package:lukerieff/networking/protocol/client/commands/command.dart';
import 'package:lukerieff/networking/protocol/pb/frame_message.pb.dart';

class ReleaseChannelCommand extends Command {
  final int channel;

  const ReleaseChannelCommand(
    super.commandNo,
    this.channel,
  );

  @override
  Frame_ProtoCmd encode() {
    return Frame_ProtoCmd(
      commandNo: commandNo,
      releaseChannel: Frame_ProtoCmd_ReleaseChannel(
        channel: channel,
      ),
    );
  }
}
