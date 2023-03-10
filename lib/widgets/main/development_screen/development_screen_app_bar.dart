import 'package:flutter/material.dart';

class DevelopmentScreenAppBar extends StatelessWidget {
  const DevelopmentScreenAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SliverAppBar(
      title: Text('Development'),
      floating: true,
      pinned: true,
      elevation: 5.0,
    );
  }
}
