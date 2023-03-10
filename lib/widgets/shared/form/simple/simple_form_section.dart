import 'package:flutter/material.dart';
import 'package:lukerieff/widgets/shared/form/simple/simple_form_section/simple_form_section_head.dart';

class SimpleFormSection extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget child;

  const SimpleFormSection({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SimpleFormSectionHead(
          title: title,
          subtitle: subtitle,
        ),
        const SizedBox(
          height: 16.0,
        ),
        child,
      ],
    );
  }
}
