import 'package:lukerieff/protocol/client/protocol_client.dart';
import 'package:lukerieff/protocol/channel.dart';

class GlobalClient {
  static final _globalClient = GlobalClient._initiate();

  ProtocolClient? _client;

  GlobalClient._initiate();

  factory GlobalClient() {
    return _globalClient;
  }

  set client(final ProtocolClient? client) {
    _client = client;
  }

  ProtocolClient get client {
    return _client!;
  }
}
