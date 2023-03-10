import 'package:flutter/material.dart';

class AuthConfigurationScreenFloatingActionButton extends StatelessWidget {
  final VoidCallback onPressed;

  const AuthConfigurationScreenFloatingActionButton({
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
