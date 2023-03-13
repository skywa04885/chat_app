import 'package:flutter/material.dart';
import 'package:lukerieff/basic_event_emitter.dart';
import 'package:lukerieff/global_client.dart';
import 'package:lukerieff/protocol/client/protocol_client_event.dart';
import 'package:lukerieff/protocol/client/protocol_client_state.dart';
import 'package:lukerieff/protocol/client/protocol_client_state_change_event.dart';

class ProtocolConnectionProvider extends ChangeNotifier {
  ProtocolClientState _protocolClientState = ProtocolClientState.disconnected;

  ProtocolConnectionProvider() {
    final GlobalClient globalClient = GlobalClient();

    globalClient.client.addListener(
      ProtocolClientEvent.stateChange,
      (final BasicEvent<ProtocolClientEvent> event) =>
          _onProtocolClientStateChange(event as ProtocolClientStateChangeEvent),
    );
  }

  void _onProtocolClientStateChange(
    final ProtocolClientStateChangeEvent event,
  ) {
    _protocolClientState = event.state;
    notifyListeners();
  }

  ProtocolClientState get protocolClientState {
    return _protocolClientState;
  }
}
