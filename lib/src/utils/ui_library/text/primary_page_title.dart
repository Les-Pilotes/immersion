import 'package:flutter/material.dart';
import 'package:immersion/src/utils/styles.dart';

class PrimaryPageTitle extends StatelessWidget {
  const PrimaryPageTitle({
    required this.title,
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: pageTitleStyle,
    );
  }
}
