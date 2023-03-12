import 'package:lukerieff/protocol/channel/services/request_error_type.dart';

class RequestError {
  final RequestErrorType type;
  final String? message;

  const RequestError(this.type, {
    this.message,
  });

  @override
  String toString() {
    if (message == null) {
      return "$type";
    }

    return "($type): $message";
  }
}