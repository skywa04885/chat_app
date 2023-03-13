import 'package:flutter/material.dart';
import 'package:lukerieff/widgets/shared/connection_status_indicator.dart';

class RootScreenChatsPageAppBar extends StatelessWidget {
  const RootScreenChatsPageAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Theme.of(context).colorScheme.primary,
      foregroundColor: Theme.of(context).colorScheme.onPrimary,
      title: const Text('Chats'),
      floating: true,
      pinned: true,
    );
  }
}
