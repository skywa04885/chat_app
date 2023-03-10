import 'package:lukerieff/networking/protocol/client/replies/child/claim_channel_reply_child.dart';
import 'package:lukerieff/networking/protocol/client/replies/child/release_channel_reply_child.dart';
import 'package:lukerieff/networking/protocol/client/replies/child/reply_child.dart';
import 'package:lukerieff/networking/protocol/client/replies/child/error_reply_child.dart';
import 'package:lukerieff/networking/protocol/pb/frame_message.pb.dart';

class Reply {
  final int commandNo;
  final ReplyChild child;

  const Reply(this.commandNo, this.child);

  T getChild<T extends ReplyChild>() {
    return child as T;
  }

  static Reply decode(final Frame_ProtoReply protoReplyMessage) {
    ReplyChild child;

    switch (protoReplyMessage.whichChild()) {
      case Frame_ProtoReply_Child.error:
        child = ErrorReplyChild.decode(protoReplyMessage.error);
        break;
      case Frame_ProtoReply_Child.claimChannel:
        child = ClaimChannelReplyChild.decode(protoReplyMessage.claimChannel);
        break;
      case Frame_ProtoReply_Child.releaseChannel:
        child = ReleaseChannelReplyChild.decode(protoReplyMessage.releaseChannel);
        break;
      default:
        throw Exception("Failed to parse proto reply, unknown child.");
    }

    return Reply(
      protoReplyMessage.commandNo,
      child,
    );
  }
}