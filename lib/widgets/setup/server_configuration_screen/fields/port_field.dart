import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:string_validator/string_validator.dart' as string_validator;

class PortField extends StatelessWidget {
  final TextEditingController textEditingController;

  const PortField({
    Key? key,
    required this.textEditingController,
  }) : super(key: key);

  String? _validator(final String? value) {
    if (value == null) {
      return "Specifying the port is required!";
    } else if (string_validator.isInt(value)) {
      return null;
    } else {
      return "Port is not of correct format.";
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly,
      ],
      validator: _validator,
      decoration: const InputDecoration(
        labelText: 'Port',
        helperText: 'Numeric value between 0 and 65535',
        icon: Icon(Icons.numbers_outlined),
      ),
    );
  }
}
