import 'package:lukerieff/protocol/client/protocol_client_configuration/protocol_client_configuration_channel.dart';

class ProtocolClientConfiguration {
  static const Duration defaultReconnectInterval = Duration(seconds: 5);
  static const Duration defaultConnectTimeout = Duration(seconds: 5);

  final String host;
  final int port;
  final List<ProtocolClientConfigurationChannel> channels;
  final Duration reconnectInterval;
  final Duration connectTimeout;

  const ProtocolClientConfiguration({
    required this.host,
    required this.port,
    required this.channels,
    this.reconnectInterval = defaultReconnectInterval,
    this.connectTimeout = defaultConnectTimeout,
  });
}