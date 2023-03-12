import 'package:flutter/cupertino.dart';
import 'package:lukerieff/datatypes/pair.dart';
import 'package:lukerieff/protocol/channel/events/callback_event_listener.dart';

abstract class NetworkingWidgetState<T extends StatefulWidget> extends State<T> {
  late int _channelIdentifier;
  late List<Pair<int, EventListenerCallback>> _eventListeners;

  NetworkingWidgetState({
    required int channelIdentifier,
    List<Pair<int, EventListenerCallback>> eventListeners = const [],
  }) {
    _channelIdentifier = channelIdentifier;
    _eventListeners = eventListeners;
  }

  void onConnected() {

  }

  void onDisconnected() {

  }
}