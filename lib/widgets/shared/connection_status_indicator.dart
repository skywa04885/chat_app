import 'package:flutter/material.dart';
import 'package:lukerieff/protocol/client/protocol_client_state.dart';
import 'package:lukerieff/providers/protocol_connection_provider.dart';
import 'package:lukerieff/widgets/shared/icon_wrapper.dart';
import 'package:provider/provider.dart';

class ConnectionStatusIndicator extends StatelessWidget {
  static const double _preferredHeight = 80.0;

  const ConnectionStatusIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProtocolClientState protocolClientState =
        context.watch<ProtocolConnectionProvider>().protocolClientState;

    if (protocolClientState == ProtocolClientState.connected) {
      return Container();
    }

    return Material(
      color: Theme.of(context).colorScheme.error,
      elevation: 5.0,
      child: Container(
        height: _preferredHeight,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconWrapper(
              iconData:
                  Icons.signal_wifi_statusbar_connected_no_internet_4_outlined,
              backgroundColor: Colors.white,
              foregroundColor: Theme.of(context).colorScheme.error,
              elevation: 0.0,
              size: 36.0,
            ),
            const SizedBox(
              width: 16.0,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Not connected!",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onError,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "We cannot connect to the server.",
                    style: TextStyle(
                      color: Theme.of(context)
                          .colorScheme
                          .onError
                          .withOpacity(0.8),
                      fontSize: 12.0,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
