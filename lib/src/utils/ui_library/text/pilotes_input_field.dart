import 'package:flutter/material.dart';
import 'package:immersion/src/features/authentication/data/validator.dart';

class PilotesInputField extends StatelessWidget {
  const PilotesInputField({
    required this.fieldHintText,
    required this.controller,
    required this.currentNode,
    required this.fieldActionType,
    this.nextNode,
    this.fieldIcon,
    super.key,
  });

  final String fieldHintText;
  final Icon? fieldIcon;
  final TextEditingController controller;
  final FocusNode currentNode;
  final FocusNode? nextNode;
  final TextInputAction fieldActionType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: currentNode,
      textInputAction: fieldActionType,
      validator: (value) => Validator.validateName(
        name: value,
      ),
      onFieldSubmitted: (v) {
        FocusScope.of(context).requestFocus(nextNode);
      },
      decoration: InputDecoration(
        labelText: fieldHintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        suffixIcon: fieldIcon,
      ),
    );
  }
}
