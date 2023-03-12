import 'dart:typed_data';
import 'package:fixnum/fixnum.dart';
import 'package:lukerieff/protocol/messages/frame_messages.pb.dart';
import 'package:lukerieff/protocol/protocol_error.dart';

class Response {
  final int reqNo;
  final int timestamp;
  Uint8List? _body;
  ProtocolServerError? _error;

  /// Constructs a new response.
  Response(
    this.reqNo,
    this.timestamp, {
        final Uint8List? body,
        final ProtocolServerError? error,
  }) {
    _body = body;
    _error = error;
  }

  Uint8List get body {
    return _body!;
  }

  bool hasBody() {
    return _body != null;
  }

  ProtocolServerError get error {
    return _error!;
  }

  bool hasError() {
    return _error != null;
  }

  /// Encodes the current response.
  FrameChanneledResponseMessage encode() {
    return FrameChanneledResponseMessage(
      reqNo: reqNo,
      timestamp: Int64(timestamp),
      body: body?.toList(),
      error: error?.encode(),
    );
  }

  /// Decodes the given response.
  static Response decode(
    final FrameChanneledResponseMessage channeledResponseMessage,
  ) {
    return Response(
      channeledResponseMessage.reqNo,
      channeledResponseMessage.timestamp.toInt(),
      body: channeledResponseMessage.hasBody()
          ? Uint8List.fromList(channeledResponseMessage.body)
          : null,
      error: channeledResponseMessage.hasError()
          ? ProtocolServerError.decode(channeledResponseMessage.error)
          : null,
    );
  }
}
