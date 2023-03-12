import 'package:flutter/material.dart';
import 'package:lukerieff/widgets/shared/slivers/persistent_header_delegates/simple_sliver_persistent_header_delegate.dart';

class DevelopmentScreenHeader extends StatelessWidget {
  final bool? loading;

  const DevelopmentScreenHeader({
    Key? key,
    this.loading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      floating: true,
      pinned: true,
      delegate: SimpleSliverPersistentHeaderDelegate(
        loading: loading,
        iconData: Icons.developer_board,
        title: 'Development information',
        subtitle: 'Exposed inner workings of the app.',
      ),
    );
  }
}
