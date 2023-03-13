import 'package:flutter/material.dart';

class ProfileScreenHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Material(
      color: Theme.of(context).colorScheme.primary,
      elevation: 5.0,
      child: Stack(
        children: [

        ],
      ),
    );
  }

  @override
  double get maxExtent => 200.0;

  @override
  double get minExtent => 120.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => true;

}