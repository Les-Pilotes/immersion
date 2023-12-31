import 'package:flutter/material.dart';
import 'package:immersion/src/utils/styles.dart';

class SmallSecondaryButton extends StatelessWidget {
  const SmallSecondaryButton({
    required this.text,
    required this.onPressed,
    super.key,
  });

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      height: 46,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(
            color: primaryColor,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            elevation: 0,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 18,
              color: primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
