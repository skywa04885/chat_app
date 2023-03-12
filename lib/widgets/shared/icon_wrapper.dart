import 'package:flutter/material.dart';

class IconWrapper extends StatelessWidget {
  final IconData iconData;
  final double? size;
  final double? elevation;
  final Color? foregroundColor;
  final Color? backgroundColor;

  const IconWrapper({
    Key? key,
    required this.iconData,
    this.size,
    this.elevation,
    this.foregroundColor,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double boxSize = size ?? 48.0;
    final double iconSize = boxSize / 2.0;
    final double borderRadius = boxSize / 4.0;

    return SizedBox(
      width: boxSize,
      height: boxSize,
      child: Material(
        borderRadius: BorderRadius.circular(borderRadius),
        color: backgroundColor ?? Theme.of(context).colorScheme.secondary,
        elevation: elevation ?? 2.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Icon(
              iconData,
              size: iconSize,
              color: foregroundColor ?? Theme.of(context).colorScheme.onSecondary,
            ),
          ),
        ),
      ),
    );
  }
}
