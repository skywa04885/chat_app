import 'dart:typed_data';
import 'package:fixnum/fixnum.dart';
import 'package:lukerieff/networking/protocol/pb/frame_message.pb.dart';

class Event {
  final int event;
  final int timestamp;
  final Uint8List? body;

  /// Constructs a new payload.
  const Event(
    this.event,
    this.timestamp, {
    this.body,
  });

  /// Encodes the current event.
  Frame_Channeled_Event encode() {
    return Frame_Channeled_Event(
      event: event,
      timestamp: Int64(timestamp),
      body: body?.toList(),
    );
  }

  /// Decodes the given event.
  static Event decode(
    final Frame_Channeled_Event encodedPayload,
  ) {
    return Event(
      encodedPayload.event,
      encodedPayload.timestamp.toInt(),
      body: encodedPayload.hasBody()
          ? Uint8List.fromList(encodedPayload.body)
          : null,
    );
  }
}
