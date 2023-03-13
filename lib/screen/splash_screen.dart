import 'dart:async';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:lukerieff/basic_event_emitter.dart';
import 'package:lukerieff/entities/UserEntity.dart';
import 'package:lukerieff/global_client.dart';
import 'package:lukerieff/global_secure_storage.dart';
import 'package:lukerieff/protocol/channel/protocol_channel_configuration.dart';
import 'package:lukerieff/protocol/channel/protocol_channel_configuration/protocol_channel_configuration_authentication.dart';
import 'package:lukerieff/protocol/channel/protocol_channel_configuration/protocol_channel_configuration_authentication/protocol_channel_configuration_token_authentication.dart';
import 'package:lukerieff/protocol/client/protocol_client_state.dart';
import 'package:lukerieff/protocol/protocol_client.dart';
import 'package:lukerieff/protocol/client/protocol_client_configuration.dart';
import 'package:lukerieff/protocol/client/protocol_client_event.dart';
import 'package:lukerieff/protocol/client/protocol_client_state_change_event.dart';
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
  static final Logger _logger = Logger();

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

    _logger.d("Initializing the global client ...");

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

    _logger.d("Waiting for client to connect ...");

    Completer<void> completer = Completer<void>();
    globalClient.client.addCallbackListener(ProtocolClientEvent.stateChange,
        (final BasicEvent<ProtocolClientEvent> basicEvent) {
      final ProtocolClientStateChangeEvent stateChangeEvent =
          basicEvent as ProtocolClientStateChangeEvent;

      if (stateChangeEvent.state == ProtocolClientState.connected) {
        completer.complete();

        return true;
      }
    });
    await completer.future;

    _logger.d("Client has connected!");

    final UserEntity me = await UserService.me();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      context.read<MeProvider>().me = me;
      await Navigator.of(context).pushReplacementNamed("/main/root");
    });
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
