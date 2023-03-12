import 'package:lukerieff/protocol/client/protocol_client_configuration/protocol_client_configuration_channel/protocol_client_configuration_channel_authentication.dart';

class ProtocolClientConfigurationChannel {
  final int identifier;
  final ProtocolClientConfigurationChannelAuthentication? authentication;

  const ProtocolClientConfigurationChannel({
    required this.identifier,
    this.authentication,
  });
}