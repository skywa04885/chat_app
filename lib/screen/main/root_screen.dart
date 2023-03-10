import 'package:flutter/material.dart';
import 'package:lukerieff/widgets/main/root_screen/root_screen_bottom_navigation_bar.dart';
import 'package:lukerieff/widgets/main/root_screen/root_screen_drawer.dart';
import 'package:lukerieff/widgets/main/root_screen/root_screen_floating_action_buttons/root_screen_new_chat_floating_action_butten.dart';
import 'package:lukerieff/widgets/main/root_screen/root_screen_pages/root_screen_chats_page.dart';

enum RootScreenSelectedPage { chats, calls, contacts }

extension RootScreenSelectedPageExt on RootScreenSelectedPage {
  IconData get icon {
    switch (this) {
      case RootScreenSelectedPage.chats:
        return Icons.chat_outlined;
      case RootScreenSelectedPage.calls:
        return Icons.wifi_calling_3_outlined;
      case RootScreenSelectedPage.contacts:
        return Icons.contacts;
    }
  }

  String get label {
    switch (this) {
      case RootScreenSelectedPage.chats:
        return "Chats";
      case RootScreenSelectedPage.calls:
        return "Calls";
      case RootScreenSelectedPage.contacts:
        return "Contacts";
    }
  }
}

class RootScreen extends StatefulWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  RootScreenSelectedPage _page = RootScreenSelectedPage.chats;

  void _onPageSelected(final RootScreenSelectedPage page) {
    setState(() {
      _page = page;
    });
  }

  Future<void> _onNewChatPressed() async {}

  /// Gets the floating action button associated with the current page.
  Widget? _getFloatingActionButton() {
    switch (_page) {
      case RootScreenSelectedPage.chats:
        return RootScreenNewChatFloatingActionButton(
          onPressed: _onNewChatPressed,
        );
      case RootScreenSelectedPage.calls:
        return null;
      case RootScreenSelectedPage.contacts:
        return null;
    }
  }

  Widget? _getBody() {
    switch (_page) {
      case RootScreenSelectedPage.chats:
        return RootScreenChatsPage();
      case RootScreenSelectedPage.calls:
        return null;
      case RootScreenSelectedPage.contacts:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_page.label),
      ),
      floatingActionButton: _getFloatingActionButton(),
      drawer: RootScreenDrawer(),
      bottomNavigationBar: RootScreenBottomNavigationBar(
        page: _page,
        onPageSelected: _onPageSelected,
      ),
      body: _getBody(),
    );
  }
}
