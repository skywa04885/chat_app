import 'package:flutter/material.dart';
import 'package:lukerieff/services/user_service/user_service_search_response/user_service_search_response_entry.dart';
import 'package:lukerieff/widgets/main/user_search_screen/user_search_screen_results_list/user_search_screen_results_list_item.dart';
import 'package:lukerieff/widgets/shared/account_picture.dart';

class UserSearchScreenResultsList extends StatelessWidget {
  final void Function(int) onUserPressed;
  final List<UserServiceSearchResponseEntry> entries;

  const UserSearchScreenResultsList({
    Key? key,
    required this.entries,
    required this.onUserPressed,
  }) : super(key: key);

  Widget _itemBuilder(final BuildContext context, final int index) {
    final UserServiceSearchResponseEntry entry = entries[index];

    return UserSearchScreenResultsListItem(
      entry: entry,
      onPressed: () => onUserPressed(entry.id),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        _itemBuilder,
        childCount: entries.length,
      ),
    );
  }
}
