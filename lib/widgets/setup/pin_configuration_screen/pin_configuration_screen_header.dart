import 'package:flutter/material.dart';
import 'package:lukerieff/widgets/shared/slivers/persistent_header_delegates/SimpleSliverPersistentHeaderDelegate.dart';

class PinConfigurationScreenHeader extends StatelessWidget {
  final bool? loading;

  const PinConfigurationScreenHeader({
    Key? key,
    required this.loading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: SimpleSliverPersistentHeaderDelegate(
        loading: loading,
        iconData: Icons.security,
        title: 'Pin configuration',
        subtitle:
            'In order to protect others from accessing the secret chats, you need to create a pin.',
      ),
      pinned: true,
      floating: true,
    );
  }
}
