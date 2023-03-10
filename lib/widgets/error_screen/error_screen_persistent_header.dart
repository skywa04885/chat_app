import 'package:flutter/material.dart';
import 'package:lukerieff/widgets/error_screen/error_screen_persistent_header/error_screen_persistent_header_delegate.dart';

class ErrorScreenPersistentHeader extends StatelessWidget {
  final String title;
  final String subtitle;

  const ErrorScreenPersistentHeader(
    this.title,
    this.subtitle, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: ErrorScreenPersistentHeaderDelegate(
        title,
        subtitle,
      ),
      floating: true,
      pinned: true,
    );
  }
}
