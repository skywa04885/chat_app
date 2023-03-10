import 'dart:typed_data';
import 'package:fixnum/fixnum.dart';
import 'package:lukerieff/networking/protocol/pb/frame_message.pb.dart';

class Request {
  final int serviceNo;
  final int reqNo;
  final int timestamp;
  final Uint8List? body;

  /// Constructs a new request.
  const Request(
    this.serviceNo,
    this.reqNo,
    this.timestamp, {
    this.body,
  });

  /// Encodes the current request.
  Frame_Channeled_Request encode() {
    return Frame_Channeled_Request(
      serviceNo: serviceNo,
      reqNo: reqNo,
      timestamp: Int64(timestamp),
      body: body?.toList(),
    );
  }

  /// Decodes the given request.
  static Request decode(final Frame_Channeled_Request request) {
    return Request(
      request.serviceNo,
      request.reqNo,
      request.timestamp.toInt(),
      body: request.hasBody() ? Uint8List.fromList(request.body) : null,
    );
  }
}
