import 'package:lukerieff/protocol/client/replies/child/claim_channel_reply_child.dart';
import 'package:lukerieff/protocol/client/replies/child/release_channel_reply_child.dart';
import 'package:lukerieff/protocol/client/replies/child/reply_child.dart';
import 'package:lukerieff/protocol/messages/frame_messages.pb.dart';
import 'package:lukerieff/protocol/protocol_error.dart';

class Reply {
  final int commandNo;
  final ReplyChild? child;
  final ProtocolServerError? error;

  const Reply(
    this.commandNo, {
    this.child,
    this.error,
  });

  bool hasChild() {
    return child != null;
  }

  bool hasError() {
    return error != null;
  }

  T getChild<T extends ReplyChild>() {
    return child as T;
  }

  static Reply decode(final FrameProtocolReplyMessage protoReplyMessage) {
    ReplyChild? child;

    switch (protoReplyMessage.whichChild()) {
      case FrameProtocolReplyMessage_Child.claimChannel:
        child = ClaimChannelReplyChild.decode(protoReplyMessage.claimChannel);
        break;
      case FrameProtocolReplyMessage_Child.releaseChannel:
        child =
            ReleaseChannelReplyChild.decode(protoReplyMessage.releaseChannel);
        break;
      case FrameProtocolReplyMessage_Child.notSet:
        break;
    }

    return Reply(
      protoReplyMessage.commandNo,
      child: child,
      error: protoReplyMessage.hasError()
          ? ProtocolServerError.decode(protoReplyMessage.error)
          : null,
    );
  }
}
