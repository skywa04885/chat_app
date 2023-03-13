import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lukerieff/services/chat_service.dart';
import 'package:lukerieff/widgets/main/create_direct_chat_screen/create_direct_chat_options_list.dart';
import 'package:lukerieff/widgets/main/create_direct_chat_screen/create_direct_chat_screen_app_bar.dart';

class CreateDirectChatScreen extends StatefulWidget {
  const CreateDirectChatScreen({Key? key}) : super(key: key);

  @override
  State<CreateDirectChatScreen> createState() => _CreateDirectChatScreenState();
}

class _CreateDirectChatScreenState extends State<CreateDirectChatScreen> {
  /// Gets called once the user has pressed the search for user button.
  Future<void> _onSearchForUserPressed() async {
    await HapticFeedback.vibrate();

    if (!mounted) return;

    final dynamic result = await Navigator.of(context).pushNamed("/main/users/search");

    final int? otherUserId = result as int?;
    if (otherUserId == null) {
      return;
    }

    await ChatService.newDirect(otherUserId);

    if (!mounted) return;

    Navigator.of(context).pop();
  }

  /// Gets called once the user has pressed the scan qr button.
  Future<void> _onScanUserQRPressed() async {
    await HapticFeedback.vibrate();

  }

  /// Builds the screen.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const CreateDirectChatScreenAppBar(),
          CreateDirectChatOptionsList(
            onSearchForUserPressed: _onSearchForUserPressed,
            onScanUserQRPressed: _onScanUserQRPressed,
          ),
          const SliverToBoxAdapter(
            child: Divider(),
          ),
        ],
      ),
    );
  }
}
