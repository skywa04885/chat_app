import 'dart:typed_data';
import 'package:fixnum/fixnum.dart';
import 'package:lukerieff/networking/protocol/pb/frame_message.pb.dart';

class Response {
  final int reqNo;
  final int timestamp;
  final Uint8List? body;

  /// Constructs a new response.
  const Response(
    this.reqNo,
    this.timestamp, {
    this.body,
  });

  /// Encodes the current response.
  Frame_Channeled_Response encode() {
    return Frame_Channeled_Response(
      reqNo: reqNo,
      timestamp: Int64(timestamp),
      body: body?.toList(),
    );
  }

  /// Decodes the given response.
  static Response decode(final Frame_Channeled_Response response) {
    return Response(
      response.reqNo,
      response.timestamp.toInt(),
      body: response.hasBody() ? Uint8List.fromList(response.body) : null,
    );
  }
}
