enum RequestErrorType {
  responseTimeout,
  connectionLost,
}

extension RequestErrorTypeExt on RequestErrorType {
  String get description {
    switch (this) {
      case RequestErrorType.responseTimeout:
        return "Response timeout";
      case RequestErrorType.connectionLost:
        return "Connection lost";
    }
  }
}