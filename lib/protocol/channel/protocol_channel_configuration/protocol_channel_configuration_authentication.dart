import 'dart:typed_data';

abstract class ProtocolChannelConfigurationAuthentication {
  /// Gets the body for the claim command.
  Uint8List getBodyForClaimCommand();
}