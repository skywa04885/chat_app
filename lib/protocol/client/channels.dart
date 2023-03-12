import 'package:lukerieff/protocol/channel.dart';
import 'package:lukerieff/protocol/channel/services/request_error.dart';

class Channels {
  final Map<int, Channel> _channels = <int, Channel>{};

  /// Adds a new channel.
  void add(final Channel channel) {
    if (_channels.containsKey(channel.identifier)) {
      throw Exception("Cannot insert channel because identifier already in use.");
    }

    _channels[channel.identifier] = channel;
  }

  /// Removes the given channel.
  void remove(final Channel channel) {
    if (!_channels.containsKey(channel.identifier)) {
      throw Exception("Cannot remove channel, since it's not in the map.");
    }

    _channels.remove(channel.identifier);
  }

  /// gets a channel by the given identifier.
  Channel? get(final int identifier) {
    return _channels[identifier];
  }

  /// Checks if there is a channel with the given identifier.
  bool contains(final int identifier) {
    return get(identifier) != null;
  }

  /// Closes all channels due to connection loss.
  void closeAllDueToConnectionLoss() {
    // Closes all the channels due to the connection loss.
    for (final Channel channel in _channels.values) {
      channel.closeDueToConnectionLoss();
    }

    // Removes all the channels from the map.
    _channels.clear();
  }
}