import 'package:lukerieff/networking/protocol/client/replies/child/reply_child.dart';
import 'package:lukerieff/networking/protocol/pb/frame_message.pb.dart';

class ErrorReplyChild extends ReplyChild {
  final Error_Code code;
  final String? message;

  const ErrorReplyChild(this.code, {
    this.message,
  });

  static ErrorReplyChild decode(final Error errorMessage) {
    return ErrorReplyChild(
      errorMessage.code,
      message: errorMessage.hasMessage() ? errorMessage.message : null,
    );
  }

  @override
  String toString() {
    if (message == null) {
      return "$code";
    }

    return "$code: $message";
  }
}
