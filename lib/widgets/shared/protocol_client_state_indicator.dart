import 'package:flutter/material.dart';
import 'package:lukerieff/basic_event_emitter.dart';
import 'package:lukerieff/global_client.dart';
import 'package:lukerieff/protocol/client/protocol_client_event.dart';
import 'package:lukerieff/protocol/client/protocol_client_state.dart';
import 'package:lukerieff/protocol/client/protocol_client_state_change_event.dart';
import 'package:lukerieff/widgets/shared/protocol_client_state_indicator/protocol_client_state_indicator_child.dart';

class ProtocolClientStateIndicator extends StatelessWidget {
  const ProtocolClientStateIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalClient globalClient = GlobalClient();

    return StreamBuilder<ProtocolClientState>(
      initialData: globalClient.client.state,
      stream: globalClient.client.addStreamEventListener(ProtocolClientEvent.stateChange)
          .map((BasicEvent<ProtocolClientEvent> event) => (event as ProtocolClientStateChangeEvent).state),
      builder: (context, snapshot) {
        final ProtocolClientState? protocolClientState = snapshot.data;
        if (protocolClientState == null) {
          return Container();
        } else if (protocolClientState == ProtocolClientState.connected) {
          return Container();
        }

        return ProtocolClientStateIndicatorChild(
          protocolClientState: protocolClientState,
        );
      }
    );
  }
}
