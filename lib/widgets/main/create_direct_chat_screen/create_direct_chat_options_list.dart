import 'package:flutter/material.dart';
import 'package:lukerieff/widgets/main/create_direct_chat_screen/create_direct_chat_options_list/create_direct_chat_options_list_item.dart';

class CreateDirectChatOptionsList extends StatelessWidget {
  final void Function() onSearchForUserPressed;
  final void Function() onScanUserQRPressed;

  const CreateDirectChatOptionsList(
      {Key? key,
      required this.onSearchForUserPressed,
      required this.onScanUserQRPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          CreateDirectChatOptionsListItem(
            onPressed: onSearchForUserPressed,
            iconData: Icons.manage_search,
            title: 'Search for user',
            subtitle: 'Start chat with person not in contacts.',
          ),
          CreateDirectChatOptionsListItem(
            onPressed: onScanUserQRPressed,
            iconData: Icons.qr_code_scanner,
            title: 'Scan QR code',
            subtitle: 'Start chat using a persons QR code.',
          ),
        ],
      ),
    );
  }
}
