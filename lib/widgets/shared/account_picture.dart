import 'package:flutter/material.dart';
import 'package:lukerieff/entities/UserEntity.dart';
import 'package:lukerieff/widgets/shared/account_picture/account_picture_default.dart';

class AccountPicture extends StatelessWidget {
  final String? name;
  final double size;

  const AccountPicture({
    Key? key,
    required this.name,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (name != null) {
      return AccountPictureDefault(
        name: name!,
        size: size,
      );
    }

    return Container();
  }
}
