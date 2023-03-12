import 'package:flutter/material.dart';
import 'package:lukerieff/widgets/shared/slivers/persistent_header_delegates/simple_sliver_persistent_header_delegate.dart';

class RootScreenChatsPageHeader extends StatelessWidget {
  final int count;

  const RootScreenChatsPageHeader({Key? key, required this.count, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      floating: true,
      pinned: true,
      delegate: SimpleSliverPersistentHeaderDelegate(
        iconData: Icons.chat_outlined,
        title: 'Chats',
        subtitle: 'Resume one of your $count chats',
      ),
    );
  }
}
