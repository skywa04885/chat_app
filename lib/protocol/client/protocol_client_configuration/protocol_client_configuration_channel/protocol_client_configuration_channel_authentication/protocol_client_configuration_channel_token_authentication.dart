import 'dart:typed_data';

import 'package:lukerieff/protocol/messages/frame_messages.pb.dart';

import '../protocol_client_configuration_channel_authentication.dart';

class ProtocolClientConfigurationChannelTokenAuthentication
    extends ProtocolClientConfigurationChannelAuthentication {
  final String token;

  ProtocolClientConfigurationChannelTokenAuthentication(this.token);

  @override
  Uint8List body() {
    final TokenAuthenticationMessage tokenAuthenticationMessage =
        TokenAuthenticationMessage(
      token: token,
    );

    return tokenAuthenticationMessage.writeToBuffer();
  }
}
