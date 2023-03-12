import 'package:flutter/material.dart';

class RootScreenChatsPageAppBar extends StatelessWidget {
  const RootScreenChatsPageAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar.medium(
      backgroundColor: Theme.of(context).colorScheme.primary,
      foregroundColor: Theme.of(context).colorScheme.onPrimary,
      title: const Text('Chats'),
      floating: true,
      pinned: true,
    );
  }
}
