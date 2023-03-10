import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:lukerieff/networking/app_server_channels.dart';
import 'package:lukerieff/networking/protocol/client/client.dart';
import 'package:lukerieff/networking/protocol/channel/channel.dart';
import 'package:lukerieff/networking/protocol/pb/frame_message.pb.dart';

class GlobalClient {
  static final _globalClient = GlobalClient._initiate();

  SecurityContext? _securityContext;
  Client? _client;
  Channel? _primaryChannel;

  GlobalClient._initiate();

  factory GlobalClient() {
    return _globalClient;
  }

  /// Gets the security context.
  Future<SecurityContext> _getSecurityContext() async {
    final ByteData certificateByteData =
        await rootBundle.load("assets/certificates/server.crt");

    // Creates the security context and adds our own certificate.
    final SecurityContext securityContext = SecurityContext.defaultContext;
    securityContext
        .setTrustedCertificatesBytes(certificateByteData.buffer.asUint8List());

    return securityContext;
  }

  /// Connects to the serer.
  Future<void> connect(
      final String host, final int port, final String token) async {
    if (_client != null) {
      await _client!.destroy();
      _client = null;
    }

    // Loads the security context.
    _securityContext ??= await _getSecurityContext();

    // Creates the secure socket.
    final SecureSocket secureSocket = await SecureSocket.connect(
      host,
      port,
      context: _securityContext,
      onBadCertificate: (_) => true, // FIXME: Remove this in production.
    );

    // Creates the client.
    final Client client = Client(secureSocket);

    // Constructs the authentication token payload and claims the primary channel.
    final TokenAuthenticationBody tokenAuthenticationBody =
        TokenAuthenticationBody(
      token: token,
    );
    final Uint8List tokenAuthenticationBodyBuffer =
        tokenAuthenticationBody.writeToBuffer();
    final Channel primaryChannel = await client.claimChannel(
      AppServerChannels.primary.identifier,
      body: tokenAuthenticationBodyBuffer,
    );

    // Stores the client and channel.
    _client = client;
    _primaryChannel = _primaryChannel;
  }

  Client get client {
    return _client!;
  }

  Channel get primaryChannel {
    return _primaryChannel!;
  }
}
