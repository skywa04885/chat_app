import 'package:lukerieff/protocol/channel/protocol_channel_configuration.dart';

class ProtocolClientConfiguration {
  static const Duration defaultReconnectInterval = Duration(seconds: 2);
  static const Duration defaultConnectTimeout = Duration(seconds: 5);
  static const Duration defaultHeartbeatInterval = Duration(seconds: 2);
  static const Duration defaultSlowConnectionThreshold =
      Duration(milliseconds: 200);

  final List<ProtocolChannelConfiguration> channelConfigurations;
  final String host;
  final int port;
  final Duration reconnectInterval;
  final Duration connectTimeout;
  final Duration heartbeatInterval;
  final Duration slowConnectionThreshold;

  const ProtocolClientConfiguration(
    this.channelConfigurations,
    this.host,
    this.port, {
    this.reconnectInterval = defaultReconnectInterval,
    this.connectTimeout = defaultConnectTimeout,
    this.heartbeatInterval = defaultHeartbeatInterval,
    this.slowConnectionThreshold = defaultSlowConnectionThreshold,
  });
}
