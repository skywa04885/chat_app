import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lukerieff/widgets/main/create_direct_chat_screen/create_direct_chat_options_list/create_direct_chat_options_list_item.dart';

class CreateDirectChatOptionsList extends StatelessWidget {
  const CreateDirectChatOptionsList({Key? key}) : super(key: key);

  Future<void> _onSearchPressed(final BuildContext context) async {
   await HapticFeedback.vibrate();

   WidgetsBinding.instance.addPostFrameCallback((_) async {
     await Navigator.of(context).pushNamed("/main/users/search");
   });
  }

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          CreateDirectChatOptionsListItem(
            onPressed: () => _onSearchPressed(context),
            iconData: Icons.manage_search,
            title: 'Search for user',
            subtitle: 'Start chat with person not in contacts.',
          ),
          CreateDirectChatOptionsListItem(
            onPressed: () => _onSearchPressed(context),
            iconData: Icons.qr_code_scanner,
            title: 'Scan QR code',
            subtitle: 'Start chat using a persons QR code.',
          ),
        ],
      ),
    );
  }
}
