import 'package:flutter/material.dart';

class PilotesInputField extends StatelessWidget {
  const PilotesInputField({
    required this.fieldHintText,
    super.key,
    this.fieldIcon,
  });

  final String fieldHintText;
  final Icon? fieldIcon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: fieldHintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        suffixIcon: fieldIcon,
      ),
    );
  }
}
