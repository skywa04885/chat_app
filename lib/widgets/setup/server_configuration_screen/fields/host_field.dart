import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart' as string_validator;

class HostField extends StatelessWidget {
  final TextEditingController textEditingController;

  const HostField({
    Key? key,
    required this.textEditingController,
  }) : super(key: key);

  String? _validator(final String? value) {
    if (value == null) {
      return "Specifying the host is required!";
    } else if (string_validator.isIP(value)) {
      return null;
    } else if (string_validator.isFQDN(value)) {
      return null;
    } else {
      return "Host is not of correct format.";
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      validator: _validator,
      decoration: const InputDecoration(
        labelText: 'Host',
        helperText: 'IPv4, IPv6 or Hostname',
        icon: Icon(Icons.account_tree_outlined),
      ),
    );
  }
}
