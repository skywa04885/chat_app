import 'package:flutter/material.dart';

class ErrorScreenPersistentHeaderDelegate
    extends SliverPersistentHeaderDelegate {
  final String title;
  final String subtitle;

  const ErrorScreenPersistentHeaderDelegate(
    this.title,
    this.subtitle,
  );

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        Positioned(
          left: 16.0,
          bottom: 16.0,
          right: 16.0,
          child: Row(
            children: [
              Icon(
                Icons.running_with_errors_outlined,
                size: 48.0,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              const SizedBox(
                width: 16.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: 22.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

  @override
  double get maxExtent => 180.0;

  @override
  double get minExtent => 100.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
