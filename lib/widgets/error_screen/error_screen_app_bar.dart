import 'package:flutter/material.dart';
import 'package:lukerieff/widgets/error_screen/error_screen_app_bar/error_screen_app_bar_dropdown_button.dart';

class ErrorScreenAppBar extends StatelessWidget {
  const ErrorScreenAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SliverAppBar(
      title: Text('App crashed'),
      pinned: true,
      floating: true,
      elevation: 5.0,
      actions: [
        ErrorScreenAppBarDropdownButton(),
      ],
    );
  }
}
