import 'dart:async';
import 'event_listener.dart';
import 'event.dart';

class StreamEventListener extends EventListener {
  final StreamController<Event> _streamController = StreamController<Event>();

  StreamEventListener(
    super.event,
  );

  Stream<Event> get stream {
    return _streamController.stream;
  }

  @override
  void onEvent(final Event event) {
    _streamController.add(event);
  }
}
