import 'package:lukerieff/networking/protocol/channel/channel.dart';

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
}