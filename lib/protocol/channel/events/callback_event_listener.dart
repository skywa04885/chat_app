import 'event.dart';
import 'event_listener.dart';

typedef EventListenerCallback = void Function(Event);

class CallbackEventListener extends EventListener {
  final EventListenerCallback callback;

  const CallbackEventListener(
    super.event,
    this.callback,
  );

  @override
  void onEvent(final Event event) {
    callback(event);
  }
}
