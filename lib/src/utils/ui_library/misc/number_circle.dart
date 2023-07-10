import 'package:flutter/material.dart';
import 'package:immersion/src/utils/styles.dart';

class NumberCircle extends StatelessWidget {
  const NumberCircle({
    required this.child,
    required this.backgroundColor,
    required this.textColor,
    super.key,
    this.radius = 16.0,
  });

  final Object child;
  final Color backgroundColor;
  final Color textColor;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius * 2.2,
      height: radius * 2,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: backgroundColor,
        border: Border.all(color: darkColor, width: 2),
      ),
      child: Center(
        child: child is String
            ? Text(
          child as String,
          style: TextStyle(
            color: textColor,
            fontSize: radius - 2,
            fontWeight: FontWeight.w700,
          ),
        )
            : Icon(
          child as IconData,
          color: textColor,
          size: radius,
        ),
      ),
    );
  }
}
