import 'package:flutter/material.dart';
import 'package:lukerieff/protocol/protocol_error.dart';

class ProtocolServerErrorDialog extends StatelessWidget {
  final ProtocolServerError error;

  const ProtocolServerErrorDialog({
    Key? key,
    required this.error,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: const Icon(Icons.dangerous_outlined),
      title: Text("Server error (${error.code.value})"),
      content: error.message == null ? null : Text(error.message!),
    );
  }
}
