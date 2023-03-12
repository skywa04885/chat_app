import 'package:flutter/material.dart';

class CreateDirectChatScreenAppBar extends StatelessWidget {
  const CreateDirectChatScreenAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar.medium(
      backgroundColor: Theme.of(context).colorScheme.primary,
      foregroundColor: Theme.of(context).colorScheme.onPrimary,
      title: const Text('Create direct chat'),
      floating: true,
      pinned: true,
      elevation: 5.0,
    );
  }
}
