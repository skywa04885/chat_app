import 'package:flutter/material.dart';

class SimpleFormSectionHead extends StatelessWidget {
  final String title;
  final String subtitle;

  const SimpleFormSectionHead({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Text(
          subtitle,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}
