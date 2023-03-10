import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:string_validator/string_validator.dart' as string_validator;

class PinField extends StatelessWidget {
  final TextEditingController textEditingController;

  const PinField({Key? key, required this.textEditingController,}) : super(key: key);

  String? _validator(final String? value) {
    if (value == null) {
      return "Specifying a pin code is required!";
    } else if (value.length > 12) {
      return "Value may not have more than 12 digits.";
    } else if (string_validator.isNumeric(value)) {
      return null;
    } else {
      return "Pin is not of correct format.";
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      validator: _validator,
      obscureText: true,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly,
      ],
      maxLength: 12,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        labelText: 'Pin',
        helperText: 'Code of 4-12 digits.',
        icon: Icon(Icons.pin),
      ),
    );
  }
}
