import 'package:flutter/material.dart';
import 'package:lukerieff/widgets/setup/auth_configuration_screen/fields/token_field.dart';
import 'package:lukerieff/widgets/shared/form/simple/simple_form_section.dart';

class AuthConfigurationScreenForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController tokenTextEditingController;

  const AuthConfigurationScreenForm({
    Key? key,
    required this.formKey,
    required this.tokenTextEditingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SimpleFormSection(
        title: 'Authentication token',
        subtitle: 'Paste the authentication token.',
        child: Column(
          children: <Widget>[
            TokenField(
              textEditingController: tokenTextEditingController,
            ),
          ],
        ),
      ),
    );
  }
}
