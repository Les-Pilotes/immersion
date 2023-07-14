import 'package:flutter/material.dart';

class PilotesInputField extends StatefulWidget {
  const PilotesInputField({
    required this.fieldHintText,
    required this.fieldName,
    required this.controller,
    required this.currentNode,
    required this.fieldActionType,
    this.passwordField = false,
    super.key,
    this.nextNode,
    this.fieldIcon,
    this.validator,
  });

  final String fieldName;
  final String fieldHintText;
  final Icon? fieldIcon;
  final bool passwordField;
  final TextEditingController controller;
  final FocusNode currentNode;
  final FocusNode? nextNode;
  final TextInputAction fieldActionType;
  final String? Function(String?)? validator;

  @override
  State<PilotesInputField> createState() => _PilotesInputFieldState();
}

class _PilotesInputFieldState extends State<PilotesInputField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      focusNode: widget.currentNode,
      textInputAction: widget.fieldActionType,
      obscureText: widget.passwordField && _obscureText,
      validator: widget.validator,
      onFieldSubmitted: (value) {
        if (widget.nextNode != null) {
          FocusScope.of(context).requestFocus(widget.nextNode);
        }
      },
      decoration: InputDecoration(
        labelText: widget.fieldHintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        suffixIcon: widget.passwordField
            ? IconButton(
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                icon: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                ),
              )
            : widget.fieldIcon,
      ),
    );
  }
}
