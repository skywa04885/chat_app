class BasicEvent<T> {
  final T event;

  const BasicEvent(this.event);
}

class BasicEventEmitter<T> {
  final Map<T, List<void Function(BasicEvent<T>)>> _listeners = {};

  /// Emits an event of the given type.
  void emit(final BasicEvent<T> event) {
    _listeners[event.event]?.forEach((final void Function(BasicEvent<T>) callback) => callback(event));
  }

  /// Adds the given listener.
  void addListener(final T event, final void Function(BasicEvent<T>) callback) {
    _listeners.putIfAbsent(event, () => []).add(callback);
  }

  /// Removes the given listener.
  void removeListener(final T event, final void Function(BasicEvent<T>) callback) {
    _listeners[event]?.remove(callback);
  }
}
