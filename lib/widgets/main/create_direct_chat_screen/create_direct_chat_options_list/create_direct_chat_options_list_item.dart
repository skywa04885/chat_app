import 'package:flutter/material.dart';
import 'package:lukerieff/widgets/shared/icon_wrapper.dart';

class CreateDirectChatOptionsListItem extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData iconData;
  final String title;
  final String subtitle;

  const CreateDirectChatOptionsListItem({
    Key? key,
    required this.onPressed,
    required this.iconData,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPressed,
      dense: true,
      trailing: IconWrapper(
        iconData: iconData,
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        size: 36.0,
        elevation: 1.0,
      ),
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }
}
