import 'package:flutter/material.dart';
import 'package:lukerieff/widgets/setup/pin_configuration_screen/fields/pin_field.dart';
import 'package:lukerieff/widgets/shared/form/simple/simple_form_section.dart';

class PinConfigurationScreenForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController pinTextEditingController;

  const PinConfigurationScreenForm({
    Key? key,
    required this.formKey,
    required this.pinTextEditingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SimpleFormSection(
        title: 'Pin code',
        subtitle: 'Specify a pin code between 1 and 12 digits.',
        child: Column(
          children: <Widget>[
            PinField(
              textEditingController: pinTextEditingController,
            ),
          ],
        ),
      ),
    );
  }
}
