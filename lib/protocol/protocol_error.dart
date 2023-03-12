import 'package:lukerieff/protocol/messages/frame_messages.pb.dart';

class ProtocolServerError {
  final ErrorMessage_Code code;
  final String? message;

  const ProtocolServerError(
    this.code, {
    this.message,
  });

  ErrorMessage encode() {
    return ErrorMessage(
      code: code,
      message: message,
    );
  }

  static ProtocolServerError decode(final ErrorMessage errorMessage) {
    return ProtocolServerError(
      errorMessage.code,
      message: errorMessage.message,
    );
  }

  @override
  String toString() {
    if (message == null) {
      return "$code";
    }

    return "($code): $message";
  }
}
