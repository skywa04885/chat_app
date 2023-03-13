enum ProtocolClientState {
  connected,
  disconnected,
  reconnecting,
  connecting,
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
      case ProtocolClientState.connecting:
        return "Connecting";
    }
  }

  String get description {
    switch (this) {
      case ProtocolClientState.connected:
        return "Active communication with the server.";
      case ProtocolClientState.disconnected:
        return "No active communication with the server.";
      case ProtocolClientState.reconnecting:
        return "Attempting to reconnect.";
      case ProtocolClientState.connecting:
        return "Attempting to establish a new connection.";
    }
  }
}