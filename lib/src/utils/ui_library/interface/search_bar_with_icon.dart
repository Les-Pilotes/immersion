import 'package:flutter/material.dart';
import 'package:immersion/src/utils/styles.dart';

class SearchBarWithIcon extends StatelessWidget {
  const SearchBarWithIcon({
    required this.icon,
    required this.hintText,
    super.key,
    this.function,
  });

  final IconData icon;
  final String hintText;
  final Function? function;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 40,
            child: TextField(
              textAlignVertical: TextAlignVertical.bottom,
              decoration: InputDecoration(
                hintText: hintText,
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
            ),
          ),
        ),
        IconButton(
          icon: Icon(icon),
          color: primaryColor,
          onPressed: () => function!(),
        ),
      ],
    );
  }
}
