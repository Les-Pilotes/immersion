import 'package:flutter/material.dart';

class SuggestionSubtitle extends StatelessWidget {
  const SuggestionSubtitle({
    required this.firstText,
    required this.secondText,
    required this.onPressed,
    super.key,
  });

  final String firstText;
  final String secondText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: DefaultTextStyle(
        style: const TextStyle(
          fontSize: 18,
        ),
        child: RichText(
          text: TextSpan(
            text: '$firstText ',
            style: const TextStyle(color: Colors.black),
            children: <TextSpan>[
              TextSpan(
                text: secondText,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
