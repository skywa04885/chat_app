import 'package:lukerieff/protocol/channel/protocol_channel_configuration.dart';

class ProtocolClientConfiguration {
  static const Duration defaultReconnectInterval = Duration(seconds: 5);
  static const Duration defaultConnectTimeout = Duration(seconds: 5);

  final List<ProtocolChannelConfiguration> channelConfigurations;
  final String host;
  final int port;
  final Duration reconnectInterval;
  final Duration connectTimeout;

  const ProtocolClientConfiguration(
    this.channelConfigurations,
    this.host,
    this.port, {
    this.reconnectInterval = defaultReconnectInterval,
    this.connectTimeout = defaultConnectTimeout,
  });
}
