import 'dart:typed_data';

import 'package:lukerieff/protocol/channel/protocol_channel_configuration/protocol_channel_configuration_authentication.dart';
import 'package:lukerieff/protocol/messages/frame_messages.pb.dart';

class ProtocolChannelConfigurationTokenAuthentication extends ProtocolChannelConfigurationAuthentication {
  final String token;

  ProtocolChannelConfigurationTokenAuthentication(this.token);

  @override
  Uint8List getBodyForClaimCommand() {
    final TokenAuthenticationMessage tokenAuthenticationMessage =
    TokenAuthenticationMessage(
      token: token,
    );

    return tokenAuthenticationMessage.writeToBuffer();
  }

}