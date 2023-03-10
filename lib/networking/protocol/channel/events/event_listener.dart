import 'event.dart';

abstract class EventListener {
  final int event;

  const EventListener(this.event);

  void onEvent(final Event event);
}
