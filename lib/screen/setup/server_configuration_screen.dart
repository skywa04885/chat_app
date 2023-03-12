import 'package:flutter/material.dart';
import 'package:lukerieff/global_secure_storage.dart';
import 'package:lukerieff/widgets/setup/server_configuration_screen/server_configuration_screen_floating_action_button.dart';
import 'package:lukerieff/widgets/setup/server_configuration_screen/server_configuration_screen_form.dart';
import 'package:lukerieff/widgets/setup/server_configuration_screen/server_configuration_screen_header.dart';

class ServerConfigurationScreen extends StatefulWidget {
  const ServerConfigurationScreen({Key? key}) : super(key: key);

  @override
  State<ServerConfigurationScreen> createState() =>
      _ServerConfigurationScreenState();
}

class _ServerConfigurationScreenState extends State<ServerConfigurationScreen> {
  bool _loading = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _hostTextEditingController =
      TextEditingController();
  final TextEditingController _portTextEditingController =
      TextEditingController();

  Future<void> _onSavePressed() async {
    final FormState? formState = _formKey.currentState;
    if (formState == null) {
      return;
    }

    setState(() {
      _loading = true;
    });

    if (!formState.validate()) {
      return;
    }

    final GlobalSecureStorage globalSecureStorage = GlobalSecureStorage();

    final String host = _hostTextEditingController.text;
    final int port = int.parse(_portTextEditingController.text);

    await globalSecureStorage.setServerHost(host);
    await globalSecureStorage.setServerPort(port);

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _loading = false;
      });

      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ServerConfigurationFloatingActionButton(
        onPressed: _onSavePressed,
      ),
      body: CustomScrollView(
        slivers: [
          ServerConfigurationScreenHeader(
            loading: _loading,
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: SliverToBoxAdapter(
              child: ServerConfigurationScreenForm(
                formKey: _formKey,
                hostTextEditingController: _hostTextEditingController,
                portTextEditingController: _portTextEditingController,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
