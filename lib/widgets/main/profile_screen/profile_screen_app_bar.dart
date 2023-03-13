import 'package:flutter/material.dart';
import 'package:lukerieff/entities/UserEntity.dart';

class ProfileScreenAppBar extends StatelessWidget {
  final UserEntity userEntity;

  const ProfileScreenAppBar(
    this.userEntity, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Theme.of(context).colorScheme.primary,
      foregroundColor: Theme.of(context).colorScheme.onPrimary,
      title: Text('Profile of @${userEntity.username}'),
      pinned: true,
      floating: true,
      actions: [
      ],
    );
  }
}
