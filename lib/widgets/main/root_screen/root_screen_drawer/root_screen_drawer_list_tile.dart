import 'package:flutter/material.dart';
import 'package:lukerieff/widgets/shared/icon_wrapper.dart';

class RootScreenDrawerListTile extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData iconData;
  final String title;
  final String? subtitle;

  const RootScreenDrawerListTile({
    Key? key,
    required this.onPressed,
    required this.iconData,
    required this.title,
    this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPressed,
      dense: true,
      trailing: IconWrapper(
        iconData: iconData,
        size: 36.0,
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        elevation: 1.0,
      ),
      title: Text(title),
      subtitle: subtitle == null ? null : Text(subtitle!),
    );
  }
}
