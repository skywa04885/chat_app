import 'package:flutter/material.dart';
import 'package:lukerieff/entities/UserEntity.dart';
import 'package:lukerieff/global_client.dart';
import 'package:lukerieff/global_secure_storage.dart';
import 'package:lukerieff/protocol/channel/protocol_channel_configuration.dart';
import 'package:lukerieff/protocol/channel/protocol_channel_configuration/protocol_channel_configuration_authentication.dart';
import 'package:lukerieff/protocol/channel/protocol_channel_configuration/protocol_channel_configuration_authentication/protocol_channel_configuration_token_authentication.dart';
import 'package:lukerieff/protocol/client/protocol_client.dart';
import 'package:lukerieff/protocol/client/protocol_client_configuration.dart';
import 'package:lukerieff/protocol/protocol_error.dart';
import 'package:lukerieff/providers/me_provider.dart';
import 'package:lukerieff/screen/error_screen.dart';
import 'package:lukerieff/services/user_service.dart';
import 'package:provider/provider.dart';

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

    final ProtocolChannelConfigurationAuthentication authentication =
        ProtocolChannelConfigurationTokenAuthentication(token);

    final GlobalClient globalClient = GlobalClient();
    globalClient.client = ProtocolClient(ProtocolClientConfiguration(
      <ProtocolChannelConfiguration>[
        ProtocolChannelConfiguration(
          0,
          authentication: authentication,
        ),
      ],
      host,
      port,
    ));

    try {
      // final UserEntity me = await UserService.me();
      //
      // WidgetsBinding.instance.addPostFrameCallback((_) {
      //   context.read<MeProvider>().me = me;
      // });
    } on ProtocolServerError catch (e) {
      WidgetsBinding.instance.addPostFrameCallback(
        (_) => showErrorScreen(
          context,
          "Failed to connect to the server.",
          "An exception was raised while we tried to connect.",
          e.toString(),
        ),
      );

      // return;
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
