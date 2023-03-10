import 'package:flutter/material.dart';

class ServerConfigurationFloatingActionButton extends StatelessWidget {
  final VoidCallback onPressed;

  const ServerConfigurationFloatingActionButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: const Icon(Icons.save),
    );
  }
}
