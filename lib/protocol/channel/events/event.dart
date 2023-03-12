import 'dart:typed_data';
import 'package:fixnum/fixnum.dart';
import 'package:lukerieff/protocol/messages/frame_messages.pb.dart';

class Event {
  final FrameChanneledEventMessage_EventNo event;
  final int timestamp;
  final Uint8List? body;

  /// Constructs a new payload.
  const Event(
    this.event,
    this.timestamp, {
    this.body,
  });

  /// Encodes the current event.
  FrameChanneledEventMessage encode() {
    return FrameChanneledEventMessage(
      eventNo: event,
      timestamp: Int64(timestamp),
      body: body?.toList(),
    );
  }

  /// Decodes the given event.
  static Event decode(
    final FrameChanneledEventMessage channeledEventMessage,
  ) {
    return Event(
      channeledEventMessage.eventNo,
      channeledEventMessage.timestamp.toInt(),
      body: channeledEventMessage.hasBody()
          ? Uint8List.fromList(channeledEventMessage.body)
          : null,
    );
  }
}
