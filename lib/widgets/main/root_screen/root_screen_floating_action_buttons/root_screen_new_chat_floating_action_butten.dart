import 'package:flutter/material.dart';

class RootScreenNewChatFloatingActionButton extends StatelessWidget {
  final VoidCallback onPressed;

  const RootScreenNewChatFloatingActionButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      onPressed: onPressed,
      child: const Icon(Icons.add),
    );
  }
}
