import 'package:flutter/material.dart';
import 'package:lukerieff/global_client.dart';
import 'package:lukerieff/global_secure_storage.dart';
import 'package:lukerieff/screen/error_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String _message = "LOADING";

  @override
  void initState() {
    super.initState();

    (() async {
      await Future.delayed(const Duration(milliseconds: 500));

      WidgetsBinding.instance.addPostFrameCallback(_configurePin);
    })();
  }

  Future<void> _configurePin(_) async {
    final GlobalSecureStorage globalSecureStorage = GlobalSecureStorage();

    setState(() {
      _message = "Checking pin configuration";
    });

    while (await globalSecureStorage.getPinHash() == null) {
      await Navigator.of(context).pushNamed("/setup/pin_configuration");
    }

    await Future.delayed(const Duration(milliseconds: 500));

    WidgetsBinding.instance.addPostFrameCallback(_configureServer);
  }

  Future<void> _configureServer(_) async {
    final GlobalSecureStorage globalSecureStorage = GlobalSecureStorage();

    setState(() {
      _message = "Checking server configuration";
    });

    while (await globalSecureStorage.getServerHost() == null ||
        await globalSecureStorage.getServerPort() == null) {
      await Navigator.of(context).pushNamed("/setup/server_configuration");
    }

    await Future.delayed(const Duration(milliseconds: 500));

    WidgetsBinding.instance.addPostFrameCallback(_configureAuthentication);
  }

  Future<void> _configureAuthentication(_) async {
    final GlobalSecureStorage globalSecureStorage = GlobalSecureStorage();

    setState(() {
      _message = "Checking authentication configuration";
    });

    while (await globalSecureStorage.getAuthenticationToken() == null) {
      await Navigator.of(context).pushNamed("/setup/auth_configuration");
    }

    await Future.delayed(const Duration(milliseconds: 500));

    WidgetsBinding.instance.addPostFrameCallback(_connect);
  }

  Future<void> _connect(_) async {
    final GlobalSecureStorage globalSecureStorage = GlobalSecureStorage();

    final String host = (await globalSecureStorage.getServerHost())!;
    final int port = (await globalSecureStorage.getServerPort())!;
    final String token = (await globalSecureStorage.getAuthenticationToken())!;

    setState(() {
      _message = "Connecting to $host:$port";
    });

    final GlobalClient globalClient = GlobalClient();

    try {
      await globalClient.connect(host, port, token);
    } on Exception catch (e) {
      WidgetsBinding.instance.addPostFrameCallback(
        (_) => showErrorScreen(
          context,
          "Failed to connect to the server.",
          "An exception was raised while we tried to connect.",
          e.toString(),
        ),
      );

      return;
    }

    WidgetsBinding.instance.addPostFrameCallback(
        (_) => Navigator.of(context).pushReplacementNamed("/main/root"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                color: Theme.of(context).colorScheme.onPrimary,
                backgroundColor:
                    Theme.of(context).colorScheme.onPrimary.withOpacity(0.2),
              ),
              const SizedBox(
                height: 16.0,
              ),
              Text(
                _message.toUpperCase(),
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}