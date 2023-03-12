import 'package:flutter/material.dart';

class RootScreenChatsPageListItem extends StatelessWidget {
  final VoidCallback? onPressed;

  const RootScreenChatsPageListItem({Key? key, this.onPressed,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Column(
              children: [
              ],
            ),
          ],
        ),
      ),
    );
  }
}
