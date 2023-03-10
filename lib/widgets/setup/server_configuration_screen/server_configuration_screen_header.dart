import 'package:flutter/material.dart';
import 'package:lukerieff/widgets/shared/slivers/persistent_header_delegates/SimpleSliverPersistentHeaderDelegate.dart';

class ServerConfigurationScreenHeader extends StatelessWidget {
  final bool? loading;

  const ServerConfigurationScreenHeader({
    Key? key,
    this.loading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: SimpleSliverPersistentHeaderDelegate(
        loading: loading,
        iconData: Icons.connect_without_contact_outlined,
        title: 'Server configuration',
        subtitle: 'Configure what server to use as message exchange.',
      ),
      pinned: true,
      floating: true,
    );
  }
}
