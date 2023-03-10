import 'package:flutter/material.dart';
import 'package:lukerieff/widgets/error_screen/error_screen_app_bar.dart';
import 'package:lukerieff/widgets/error_screen/error_screen_exception.dart';
import 'package:lukerieff/widgets/error_screen/error_screen_persistent_header.dart';

Future<void> showErrorScreen(
  final BuildContext context,
  final String title,
  final String subtitle,
  final String exception,
) async {
  final MaterialPageRoute<ErrorScreen> materialPageRoute = MaterialPageRoute(
    builder: (BuildContext context) {
      return ErrorScreen(
        title,
        subtitle,
        exception,
      );
    },
  );

  await Navigator.of(context).pushReplacement(materialPageRoute);
}

class ErrorScreen extends StatefulWidget {
  final String title;
  final String subtitle;
  final String exception;

  const ErrorScreen(
    this.title,
    this.subtitle,
      this.exception,
      {
    Key? key,
  }) : super(key: key);

  @override
  State<ErrorScreen> createState() => _ErrorScreenState();
}

class _ErrorScreenState extends State<ErrorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const ErrorScreenAppBar(),
          ErrorScreenPersistentHeader(
            widget.title,
            widget.subtitle,
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: SliverToBoxAdapter(
              child: ErrorScreenException('Exception', widget.exception.toString()),
            ),
          ),
        ],
      ),
    );
  }
}
