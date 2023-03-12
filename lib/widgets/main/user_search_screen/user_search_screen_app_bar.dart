import 'package:flutter/material.dart';
import 'package:lukerieff/widgets/main/user_search_screen/user_search_screen_app_bar/user_search_screen_app_bar_bottom.dart';

class UserSearchScreenAppBar extends StatelessWidget {
  final void Function(String) onSearchQuery;
  final bool loading;

  const UserSearchScreenAppBar({
    Key? key,
    required this.onSearchQuery,
    required this.loading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Theme.of(context).colorScheme.primary,
      title: const Text('Search for user'),
      bottom: UserSearchScreenAppBarBottom(
        onSearchQuery: onSearchQuery,
        loading: loading,
      ),
    );
  }
}
