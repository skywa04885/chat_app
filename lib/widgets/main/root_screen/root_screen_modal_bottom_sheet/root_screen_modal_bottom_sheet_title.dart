import 'package:flutter/material.dart';

class RootScreenModalBottomSheetTitle extends StatelessWidget {
  final String title;

  const RootScreenModalBottomSheetTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
