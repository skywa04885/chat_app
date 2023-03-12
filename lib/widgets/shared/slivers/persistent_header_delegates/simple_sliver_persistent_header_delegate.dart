import 'package:flutter/material.dart';

class SimpleSliverPersistentHeaderDelegate
    extends SliverPersistentHeaderDelegate {
  final IconData iconData;
  final String title;
  final String subtitle;
  final bool? loading;

  const SimpleSliverPersistentHeaderDelegate({
    required this.iconData,
    required this.title,
    required this.subtitle,
    this.loading,
  });

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
          bottom: 16.0,
          left: 16.0,
          right: 16.0,
          child: Row(
            children: [
              Icon(
                iconData,
                size: 48.0,
              ),
              const SizedBox(
                width: 16.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontSize: 14.0,
                        fontWeight: FontWeight.normal,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0.0,
          left: 0.0,
          right: 0.0,
          child: Visibility(
            visible: loading ?? false,
            child: LinearProgressIndicator(
              color: Theme.of(context).colorScheme.onPrimary,
              backgroundColor:
                  Theme.of(context).colorScheme.onPrimary.withOpacity(0.2),
            ),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => 200.0;

  @override
  double get minExtent => 160.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
