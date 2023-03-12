import 'package:flutter/material.dart';

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
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(iconData),
        ],
      ),
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }
}
