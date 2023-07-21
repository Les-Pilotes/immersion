import 'package:flutter/material.dart';
import 'package:immersion/src/utils/styles.dart';
import 'package:immersion/src/utils/ui_library/text/primary_page_title.dart';

class BreadCrumbNavigationBar extends StatelessWidget {
  const BreadCrumbNavigationBar({
    required this.title,
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios_new_rounded),
                color: primaryColor,
                onPressed: () => Navigator.pop(context),
              ),
              PrimaryPageTitle(
                title: title,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
