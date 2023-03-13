import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lukerieff/services/user_service/user_service_search_response/user_service_search_response_entry.dart';
import 'package:lukerieff/widgets/shared/account_picture.dart';

class UserSearchScreenResultsListItem extends StatelessWidget {
  final UserServiceSearchResponseEntry entry;
  final void Function() onPressed;

  const UserSearchScreenResultsListItem({Key? key,
   required this.entry,
  required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String title = entry.fullName ?? "@${entry.username}";
    final String subtitle = entry.email;

    return ListTile(
      onTap: onPressed,
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
}
