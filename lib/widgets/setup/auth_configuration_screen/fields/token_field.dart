import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TokenField extends StatelessWidget {
  final TextEditingController textEditingController;

  const TokenField({
    Key? key,
    required this.textEditingController,
  }) : super(key: key);

  String? _validator(final String? value) {
    if (value == null) {
      return "Authentication token is required!";
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      validator: _validator,
      obscureText: true,
      decoration: const InputDecoration(
        labelText: 'Token',
        helperText: 'Paste Auth0-JWT here.',
        icon: Icon(Icons.token_outlined),
      ),
    );
  }
}
