import 'package:lukerieff/protocol/client/replies/child/reply_child.dart';
import 'package:lukerieff/protocol/messages/frame_messages.pb.dart';

class ClaimChannelReplyChild extends ReplyChild {
  static ClaimChannelReplyChild decode(
    final FrameProtocolClaimChannelReplyMessage claimChannelReplyMessage,
  ) {
    return ClaimChannelReplyChild();
  }
}
