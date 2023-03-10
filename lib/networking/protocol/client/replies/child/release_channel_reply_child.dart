import 'package:lukerieff/networking/protocol/client/replies/child/reply_child.dart';
import 'package:lukerieff/networking/protocol/pb/frame_message.pb.dart';

class ReleaseChannelReplyChild extends ReplyChild {
  static ReleaseChannelReplyChild decode(final Frame_ProtoReply_ReleaseChannel releaseChannelReplyMessage) {
    return ReleaseChannelReplyChild();
  }
}
