import 'package:flutter/material.dart';
import 'package:lukerieff/protocol/client/protocol_client_state.dart';

class ConnectionStatusAppBarBottom extends StatelessWidget implements PreferredSizeWidget {
  const ConnectionStatusAppBarBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.error,
      child: Row(
        children: [
          Column(
            children: [
              Text(ProtocolClientState.disconnected.label),
              Text(ProtocolClientState.disconnected.description),
            ],
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(120.0);
}
