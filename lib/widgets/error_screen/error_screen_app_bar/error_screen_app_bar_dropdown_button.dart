import 'package:flutter/material.dart';
import 'package:lukerieff/global_secure_storage.dart';

class ErrorScreenAppBarDropdownButton extends StatelessWidget {
  const ErrorScreenAppBarDropdownButton({Key? key}) : super(key: key);

  Future<void> _onWipePressed() async {
    final GlobalSecureStorage globalSecureStorage = GlobalSecureStorage();

    globalSecureStorage.clear();
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (final BuildContext context) {
        return [
          PopupMenuItem(
            onTap: _onWipePressed,
            child: const Text("Wipe app"),
          ),
        ];
      },
    );
  }
}
