import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:lukerieff/protocol/client/protocol_client.dart';
import 'package:lukerieff/protocol/channel/channel.dart';
import 'package:lukerieff/protocol/messages/frame_messages.pb.dart';

class GlobalClient {
  static final _globalClient = GlobalClient._initiate();

  ProtocolClient? _client;
  Channel? _primaryChannel;

  GlobalClient._initiate();

  factory GlobalClient() {
    return _globalClient;
  }

  /// Connects to the serer.
  Future<void> connect(
      final String host, final int port, final String token) async {
    if (_client != null) {
      await _client!.destroy();
      _client = null;
    }

    _client = ProtocolClient(host, port);

    _client = client;
    _primaryChannel = primaryChannel;
  }

  ProtocolClient get client {
    return _client!;
  }

  Channel get primaryChannel {
    return _primaryChannel!;
  }
}
