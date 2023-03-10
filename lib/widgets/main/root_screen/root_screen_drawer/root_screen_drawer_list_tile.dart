import 'package:flutter/material.dart';

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
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            iconData,
          ),
        ],
      ),
      title: Text(title),
      subtitle: subtitle == null ? null : Text(subtitle!),
    );
  }
}
