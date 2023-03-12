import 'package:lukerieff/protocol/channel/protocol_channel_configuration/protocol_channel_configuration_authentication.dart';

class ProtocolChannelConfiguration {
  final int identifier;
  final ProtocolChannelConfigurationAuthentication ?authentication;

  const ProtocolChannelConfiguration(this.identifier, {
    this.authentication,
  });
}