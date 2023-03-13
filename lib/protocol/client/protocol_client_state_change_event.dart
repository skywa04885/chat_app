import 'package:lukerieff/basic_event_emitter.dart';
import 'package:lukerieff/protocol/client/protocol_client_event.dart';
import 'package:lukerieff/protocol/client/protocol_client_state.dart';

class ProtocolClientStateChangeEvent extends BasicEvent<ProtocolClientEvent> {
  final ProtocolClientState state;

  const ProtocolClientStateChangeEvent(this.state)
      : super(ProtocolClientEvent.stateChange);
}
