import 'package:flutter/material.dart';

class RootScreenChatsPageList extends StatelessWidget {
  const RootScreenChatsPageList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (final BuildContext context, final int index) {
          return Container();
        },
        childCount: 0,
      ),
    );
  }
}
