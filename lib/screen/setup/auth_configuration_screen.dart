import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lukerieff/global_secure_storage.dart';
import 'package:lukerieff/widgets/setup/auth_configuration_screen/auth_configuration_screen_floating_action_button.dart';
import 'package:lukerieff/widgets/setup/auth_configuration_screen/auth_configuration_screen_form.dart';
import 'package:lukerieff/widgets/setup/auth_configuration_screen/auth_configuration_screen_header.dart';
import 'package:lukerieff/widgets/setup/pin_configuration_screen/pin_configuration_screen_floating_action_button.dart';
import 'package:lukerieff/widgets/setup/pin_configuration_screen/pin_configuration_screen_form.dart';
import 'package:lukerieff/widgets/setup/pin_configuration_screen/pin_configuration_screen_header.dart';
import 'package:crypto/crypto.dart';

class AuthConfigurationScreen extends StatefulWidget {
  const AuthConfigurationScreen({Key? key}) : super(key: key);

  @override
  State<AuthConfigurationScreen> createState() => _AuthConfigurationScreenState();
}

class _AuthConfigurationScreenState extends State<AuthConfigurationScreen> {
  bool _loading = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _tokenTextEditingController =
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

    final String token = _tokenTextEditingController.text;
    await globalSecureStorage.setAuthenticationToken(token);

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
      floatingActionButton: AuthConfigurationScreenFloatingActionButton(
        onPressed: _onSavePressed,
      ),
      body: CustomScrollView(
        slivers: [
          AuthConfigurationScreenHeader(
            loading: _loading,
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: SliverToBoxAdapter(
              child: AuthConfigurationScreenForm(
                formKey: _formKey,
                tokenTextEditingController: _tokenTextEditingController,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
