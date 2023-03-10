import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lukerieff/global_secure_storage.dart';
import 'package:lukerieff/widgets/setup/pin_configuration_screen/pin_configuration_screen_floating_action_button.dart';
import 'package:lukerieff/widgets/setup/pin_configuration_screen/pin_configuration_screen_form.dart';
import 'package:lukerieff/widgets/setup/pin_configuration_screen/pin_configuration_screen_header.dart';
import 'package:crypto/crypto.dart';

class PinConfigurationScreen extends StatefulWidget {
  const PinConfigurationScreen({Key? key}) : super(key: key);

  @override
  State<PinConfigurationScreen> createState() => _PinConfigurationScreenState();
}

class _PinConfigurationScreenState extends State<PinConfigurationScreen> {
  bool _loading = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _pinTextEditingController =
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

    final String pin = _pinTextEditingController.text;
    final String pinHash = sha256.convert(utf8.encode(pin)).toString();
    await globalSecureStorage.setPinHash(pinHash);
    
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
      floatingActionButton: PinConfigurationScreenFloatingActionButton(
        onPressed: _onSavePressed,
      ),
      body: CustomScrollView(
        slivers: [
          PinConfigurationScreenHeader(
            loading: _loading,
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: SliverToBoxAdapter(
              child: PinConfigurationScreenForm(
                formKey: _formKey,
                pinTextEditingController: _pinTextEditingController,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
