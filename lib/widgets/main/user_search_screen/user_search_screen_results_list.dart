import 'package:flutter/material.dart';
import 'package:lukerieff/services/user_service/user_service_search_response/user_service_search_response_entry.dart';
import 'package:lukerieff/widgets/shared/account_picture.dart';

class UserSearchScreenResultsList extends StatelessWidget {
  final List<UserServiceSearchResponseEntry> entries;

  const UserSearchScreenResultsList({
    Key? key,
    required this.entries,
  }) : super(key: key);

  Widget _itemBuilder(final BuildContext context, final int index) {
    final UserServiceSearchResponseEntry entry = entries[index];

    final String title = entry.fullName ?? "@${entry.username}";
    final String subtitle = entry.email;

    return ListTile(
      onTap: (){},
      leading: AccountPicture(
        size: 36.0,
        name: entry.username,
      ),
      dense: true,
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.arrow_circle_right_outlined),
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
