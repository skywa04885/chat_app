import 'package:lukerieff/protocol/channel/events/event.dart';
import 'package:lukerieff/protocol/channel/events/event_listener.dart';

class EventListeners {
  final Map<int, List<EventListener>> _listeners = <int, List<EventListener>>{};

  void add(final EventListener eventListener) {
    _listeners
        .putIfAbsent(eventListener.event, () => <EventListener>[])
        .add(eventListener);
  }

  /// Gets called when an event has been emitted.
  void onEvent(final Event event) {
    // Gets the listeners for the event.
    List<EventListener>? listeners = _listeners[event.event];

    // Returns if there are none.
    if (listeners == null) {
      return;
    }

    // Calls each event listener.
    for (final EventListener eventListener in listeners) {
      eventListener.onEvent(event);
    }
  }
}
