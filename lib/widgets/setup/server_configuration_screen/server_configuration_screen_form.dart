import 'package:flutter/material.dart';
import 'package:lukerieff/widgets/setup/server_configuration_screen/fields/host_field.dart';
import 'package:lukerieff/widgets/setup/server_configuration_screen/fields/port_field.dart';
import 'package:lukerieff/widgets/shared/form/simple/simple_form_section.dart';

class ServerConfigurationScreenForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController hostTextEditingController;
  final TextEditingController portTextEditingController;

  const ServerConfigurationScreenForm({
    Key? key,
    required this.formKey,
    required this.hostTextEditingController,
    required this.portTextEditingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SimpleFormSection(
        title: 'Host and port',
        subtitle: 'Specify the port and the host on which the port is opened.',
        child: Column(
          children: <Widget>[
            HostField(textEditingController: hostTextEditingController),
            PortField(textEditingController: portTextEditingController),
          ],
        ),
      ),
    );
  }
}
