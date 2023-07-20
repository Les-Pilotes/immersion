import 'package:flutter/material.dart';

class SubSection extends StatelessWidget {
  const SubSection({
    required this.text,
    super.key,
    this.leadingIcon,
  });

  final String text;
  final IconData? leadingIcon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Icon(
              leadingIcon,
              color: Colors.black,
            ),
            const SizedBox(
              width: 16,
            ),
            Text(
              text,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
        const Icon(
          Icons.arrow_forward_ios,
          size: 18,
          color: Colors.black,
        ),
      ],
    );
  }
}
