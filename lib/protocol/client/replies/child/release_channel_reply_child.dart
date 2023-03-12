import 'package:lukerieff/protocol/client/replies/child/reply_child.dart';
import 'package:lukerieff/protocol/messages/frame_messages.pbserver.dart';

class ReleaseChannelReplyChild extends ReplyChild {
  static ReleaseChannelReplyChild decode(
    final FrameProtocolReleaseChannelReplyMessage releaseChannelReplyMessage,
  ) {
    return ReleaseChannelReplyChild();
  }
}
