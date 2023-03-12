import 'package:flutter/material.dart';
import 'package:lukerieff/entities/UserEntity.dart';

class AccountPictureDefault extends StatelessWidget {
  final String name;
  final double size;

  const AccountPictureDefault({
    Key? key,
    required this.name,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double boxSize = size;
    final double iconSize = boxSize / 2.0;
    final double borderRadius = boxSize / 4.0;

    return SizedBox(
      width: boxSize,
      height: boxSize,
      child: Material(
        color: Theme.of(context).colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(borderRadius),
        elevation: 5.0,
        child: Center(
          child: Text(
            name.substring(0, 1).toUpperCase(),
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: iconSize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
