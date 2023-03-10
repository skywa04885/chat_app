import 'package:lukerieff/networking/protocol/client/replies/child/reply_child.dart';
import 'package:lukerieff/networking/protocol/pb/frame_message.pb.dart';

class ClaimChannelReplyChild extends ReplyChild {
  static ClaimChannelReplyChild decode(
    final Frame_ProtoReply_ClaimChannel claimChannelReplyMessage,
  ) {
    return ClaimChannelReplyChild();
  }
}
