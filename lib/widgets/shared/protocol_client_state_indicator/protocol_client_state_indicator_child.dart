import 'package:flutter/material.dart';
import 'package:lukerieff/protocol/client/protocol_client_state.dart';
import 'package:lukerieff/widgets/shared/icon_wrapper.dart';

class ProtocolClientStateIndicatorChild extends StatelessWidget {
  final ProtocolClientState protocolClientState;

  const ProtocolClientStateIndicatorChild({Key? key, required this.protocolClientState,}) : super(key: key);


  Color _getColor() {
    switch (protocolClientState) {
      case ProtocolClientState.reconnecting:
        return Colors.teal;
      case ProtocolClientState.connecting:
        return Colors.indigo;
      case ProtocolClientState.disconnected:
        return Colors.red;
      default:
        throw UnimplementedError();
    }
  }

  IconData _getIconData() {
    switch (protocolClientState) {
      case ProtocolClientState.reconnecting:
        return Icons.cast_connected_rounded;
      case ProtocolClientState.connecting:
        return Icons.cast_connected_rounded;
      case ProtocolClientState.disconnected:
        return Icons.signal_wifi_statusbar_connected_no_internet_4_outlined;
      default:
        throw UnimplementedError();
    }
  }

  bool _getIsLoading() {
    return protocolClientState == ProtocolClientState.connecting || protocolClientState == ProtocolClientState.reconnecting;
  }

  @override
  Widget build(BuildContext context) {
    final IconData iconData = _getIconData();
    final Color backgroundColor = _getColor();
    final bool isLoading = _getIsLoading();

    return Container(
      color: backgroundColor,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconWrapper(
                  iconData: iconData,
                  backgroundColor: Colors.white,
                  foregroundColor: backgroundColor,
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
                        protocolClientState.label,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        protocolClientState.description,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 4.0,
            child: Visibility(
              visible: isLoading,
              child: LinearProgressIndicator(
                color: Colors.white,
                backgroundColor: Colors.white.withOpacity(0.2),
              ),
            ),
          )
        ],
      ),
    );
  }
}
