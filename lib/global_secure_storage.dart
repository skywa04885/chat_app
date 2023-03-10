import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class GlobalSecureStorage {
  static const String authenticationTokenKey = "authentication.token";
  static const String pinHashKey = "pin_hash";
  static const String serverHostKey = "server.host";
  static const String serverPortKey = "server.port";

  static final GlobalSecureStorage _instance = GlobalSecureStorage._initiate();

  final FlutterSecureStorage _flutterSecureStorage =
      const FlutterSecureStorage();

  GlobalSecureStorage._initiate();

  factory GlobalSecureStorage() {
    return _instance;
  }

  Future<void> clear() async {
    await _flutterSecureStorage.deleteAll();
  }

  Future<void> setAuthenticationToken(final String token) async {
    await _flutterSecureStorage.write(
      key: authenticationTokenKey,
      value: token,
    );
  }

  Future<String?> getAuthenticationToken() async {
    return _flutterSecureStorage.read(
      key: authenticationTokenKey,
    );
  }

  Future<void> setPinHash(final String pin) async {
    await _flutterSecureStorage.write(
      key: pinHashKey,
      value: pin,
    );
  }

  Future<String?> getPinHash() async {
    return _flutterSecureStorage.read(
      key: pinHashKey,
    );
  }

  Future<void> setServerHost(final String host) async {
    await _flutterSecureStorage.write(
      key: serverHostKey,
      value: host,
    );
  }

  Future<String?> getServerHost() async {
    return _flutterSecureStorage.read(
      key: serverHostKey,
    );
  }

  Future<void> setServerPort(final int port) async {
    await _flutterSecureStorage.write(
      key: serverPortKey,
      value: port.toString(),
    );
  }

  Future<int?> getServerPort() async {
    final String? portString = await _flutterSecureStorage.read(
      key: serverPortKey,
    );

    if (portString == null) {
      return null;
    }

    return int.parse(portString);
  }
}
