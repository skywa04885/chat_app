enum ProtocolClientState {
  connected,
  disconnected,
  reconnecting,
}

extension ProtocolClientStateExt on ProtocolClientState {
  String get label {
    switch (this) {
      case ProtocolClientState.connected:
        return "Connected";
      case ProtocolClientState.disconnected:
        return "Disconnected";
      case ProtocolClientState.reconnecting:
        return "Reconnecting";
    }
  }

  String get description {
    switch (this) {
      case ProtocolClientState.connected:
        return "Active communication with the server.";
      case ProtocolClientState.disconnected:
        return "No active communication with the server.";
      case ProtocolClientState.reconnecting:
        return "Attempting to establish new connection with the server.";
    }
  }
}