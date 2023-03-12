import 'dart:typed_data';
import 'package:fixnum/fixnum.dart';
import 'package:lukerieff/protocol/messages/frame_messages.pb.dart';

class Request {
  final FrameChanneledRequestMessage_ServiceNo serviceNo;
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
  FrameChanneledRequestMessage encode() {
    return FrameChanneledRequestMessage(
      serviceNo: serviceNo,
      reqNo: reqNo,
      timestamp: Int64(timestamp),
      body: body?.toList(),
    );
  }

  /// Decodes the given request.
  static Request decode(
    final FrameChanneledRequestMessage channeledRequestMessage,
  ) {
    return Request(
      channeledRequestMessage.serviceNo,
      channeledRequestMessage.reqNo,
      channeledRequestMessage.timestamp.toInt(),
      body: channeledRequestMessage.hasBody()
          ? Uint8List.fromList(channeledRequestMessage.body)
          : null,
    );
  }
}
