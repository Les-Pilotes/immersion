import 'package:flutter/material.dart';
import 'package:immersion/src/utils/styles.dart';
import 'package:immersion/src/utils/ui_library/text/primary_page_title.dart';

class BreadCrumbNavigationBarIcons extends StatelessWidget {
  const BreadCrumbNavigationBarIcons({
    required this.title, required this.firstIcon, required this.secondIcon, super.key,
  });

  final String title;
  final IconData firstIcon;
  final IconData secondIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
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
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    firstIcon,
                    size: 25,
                    color: primaryColor,
                  ),
                  const SizedBox(width: 20),
                  Icon(
                    secondIcon,
                    size: 25,
                    color: primaryColor,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
