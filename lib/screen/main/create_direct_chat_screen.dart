import 'package:flutter/material.dart';
import 'package:lukerieff/widgets/main/create_direct_chat_screen/create_direct_chat_options_list.dart';
import 'package:lukerieff/widgets/main/create_direct_chat_screen/create_direct_chat_screen_app_bar.dart';

class CreateDirectChatScreen extends StatefulWidget {
  const CreateDirectChatScreen({Key? key}) : super(key: key);

  @override
  State<CreateDirectChatScreen> createState() => _CreateDirectChatScreenState();
}

class _CreateDirectChatScreenState extends State<CreateDirectChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const CreateDirectChatScreenAppBar(),
          const CreateDirectChatOptionsList(),
          const SliverToBoxAdapter(
            child: Divider(),
          ),
        ],
      ),
    );
  }
}
