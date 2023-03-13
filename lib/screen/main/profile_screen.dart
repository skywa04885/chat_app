import 'package:flutter/material.dart';
import 'package:lukerieff/entities/UserEntity.dart';
import 'package:lukerieff/widgets/main/profile_screen/profile_screen_app_bar.dart';
import 'package:lukerieff/widgets/main/profile_screen/profile_screen_header.dart';

class ProfileScreen extends StatefulWidget {
  final UserEntity userEntity;

  const ProfileScreen(this.userEntity, {Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          ProfileScreenAppBar(widget.userEntity),
          ProfileScreenHeader(),
        ],
      ),
    );
  }
}
