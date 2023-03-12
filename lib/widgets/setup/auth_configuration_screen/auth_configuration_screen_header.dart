import 'package:flutter/material.dart';
import 'package:lukerieff/widgets/shared/slivers/persistent_header_delegates/simple_sliver_persistent_header_delegate.dart';

class AuthConfigurationScreenHeader extends StatelessWidget {
  final bool? loading;

  const AuthConfigurationScreenHeader({
    Key? key,
    required this.loading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: SimpleSliverPersistentHeaderDelegate(
        loading: loading,
        iconData: Icons.security,
        title: 'Authentication configuration',
        subtitle:
            'Perform the configuration required for the authentication to the server.',
      ),
      pinned: true,
      floating: true,
    );
  }
}
