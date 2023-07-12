import 'package:flutter/material.dart';
import 'package:immersion/src/utils/styles.dart';

class ArticleTile extends StatelessWidget {
  const ArticleTile({
    required this.title,
    required this.date,
    required this.length,
    required this.theme,
    super.key,
  });

  final String title;
  final String date;
  final String length;
  final String theme;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: 360,
        height: 95,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: primaryColor,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Row(
                      children: [
                        Text(date),
                        const Text(" • "),
                        Text(length),
                      ],
                    ),
                    Text(theme),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
