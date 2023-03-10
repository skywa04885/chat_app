enum AppServerChannels {
  primary,
}

extension AppServerChannelsExt on AppServerChannels {
  /// Gets the identifier.
  int get identifier {
    switch (this) {
      case AppServerChannels.primary:
        return 69;
    }
  }
}
