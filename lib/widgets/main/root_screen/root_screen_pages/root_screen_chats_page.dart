import 'package:flutter/material.dart';
import 'package:lukerieff/widgets/main/root_screen/root_screen_pages/root_screen_chats_page/root_screen_chats_page_header.dart';

class RootScreenChatsPage extends StatefulWidget {
  const RootScreenChatsPage({Key? key}) : super(key: key);

  @override
  State<RootScreenChatsPage> createState() => _RootScreenChatsPageState();
}

class _RootScreenChatsPageState extends State<RootScreenChatsPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        RootScreenChatsPageHeader(
          count: 0,
        )
      ],
    );
  }
}
