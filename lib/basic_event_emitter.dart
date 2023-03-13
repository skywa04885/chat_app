import 'dart:async';

abstract class BasicEventListener<T> {
  final T _event;
  final BasicEventEmitter<T> _eventEmitter;

  const BasicEventListener(this._event, this._eventEmitter);

  void onEmitted(final BasicEvent<T> event);
}

class BasicCallbackEventListener<T> extends BasicEventListener<T> {
  final bool? Function(BasicEvent<T>) callback;

  BasicCallbackEventListener(super._event, super._eventEmitter, this.callback);

  @override
  void onEmitted(final BasicEvent<T> event) {
    if (callback(event) == true) {
      _eventEmitter.removeListener(this);
    }
  }
}

class BasicStreamEventListener<T> extends BasicEventListener<T> {
  final StreamController<BasicEvent<T>> _streamController =
      StreamController<BasicEvent<T>>();

  BasicStreamEventListener(super._event, super._eventEmitter) {
    _streamController.onCancel = () => _eventEmitter.removeListener(this);
  }

  Stream<BasicEvent<T>> get stream {
    return _streamController.stream;
  }

  @override
  void onEmitted(final BasicEvent<T> event) {
    _streamController.add(event);
  }
}

class BasicEvent<T> {
  final T event;

  const BasicEvent(this.event);
}

class BasicEventEmitter<T> {
  final Map<T, List<BasicEventListener<T>>> _listeners = {};

  /// Emits an event of the given type.
  void emit(final BasicEvent<T> event) {
    final List<BasicEventListener<T>>? listeners = _listeners[event.event];
    if (listeners == null) {
      return;
    }

    for (final BasicEventListener<T> listener in listeners) {
      listener.onEmitted(event);
    }
  }

  /// Adds a new stream event listener.
  Stream<BasicEvent<T>> addStreamEventListener(final T eventIdentifier) {
    final BasicStreamEventListener<T> eventListener =
        BasicStreamEventListener(eventIdentifier, this);

    _listeners.putIfAbsent(eventIdentifier, () => []).add(eventListener);

    return eventListener.stream;
  }

  /// Adds a once event listener, that only triggers once.
  BasicCallbackEventListener<T> addCallbackOnceListener(
      final T eventIdentifier, final void Function(BasicEvent<T>) callback) {
    return addCallbackListener(eventIdentifier, (final BasicEvent<T> event) {
      callback(event);
      return true;
    });
  }

  /// Adds the given listener.
  BasicCallbackEventListener<T> addCallbackListener(
      final T eventIdentifier, final bool? Function(BasicEvent<T>) callback) {
    final BasicCallbackEventListener<T> eventListener =
        BasicCallbackEventListener(eventIdentifier, this, callback);

    _listeners.putIfAbsent(eventIdentifier, () => []).add(eventListener);

    return eventListener;
  }

  /// Removes the given event listener.
  void removeListener(final BasicEventListener<T> eventListener) {
    _listeners[eventListener._event]?.remove(eventListener);
  }
}
