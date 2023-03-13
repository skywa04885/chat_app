import 'package:flutter/material.dart';
import 'package:lukerieff/widgets/shared/icon_wrapper.dart';

class RootScreenModalBottomSheetItem extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final String subtitle;
  final IconData iconData;

  const RootScreenModalBottomSheetItem({
    Key? key,
    required this.onPressed,
    required this.title,
    required this.subtitle,
    required this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPressed,
      trailing: IconWrapper(
        iconData: iconData,
        elevation: 0.0,
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        foregroundColor: Theme.of(context).colorScheme.primary,
        size: 36.0,
      ),
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }
}
