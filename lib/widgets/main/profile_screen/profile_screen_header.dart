import 'package:flutter/material.dart';
import 'package:lukerieff/widgets/main/profile_screen/profile_screen_header/profile_screen_header_delegate.dart';

class ProfileScreenHeader extends StatelessWidget {
  const ProfileScreenHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: ProfileScreenHeaderDelegate(),
      pinned: true,
      floating: true,
    );
  }
}
