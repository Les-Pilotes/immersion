import 'package:flutter/material.dart';
import 'package:immersion/src/utils/styles.dart';
import 'package:immersion/src/utils/ui_library/text/primary_page_title.dart';

class BreadCrumbNavigationBarIcons extends StatelessWidget {
  const BreadCrumbNavigationBarIcons({
    required this.title,
    required this.firstIcon,
    required this.firstIconOnPressed,
    required this.secondIcon,
    required this.secondIconOnPressed,
    this.participantStream,
    super.key,
  });

  final String title;
  final IconData firstIcon;
  final VoidCallback? firstIconOnPressed;
  final IconData secondIcon;
  final VoidCallback? secondIconOnPressed;
  final Stream<List<String>>? participantStream;

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
                  StreamBuilder<List<String>>(
                    stream: participantStream,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      }

                      final count = snapshot.data?.length ?? 0;

                      return IconButton(
                        icon: Stack(
                          alignment: Alignment.center,
                          children: [
                            Icon(
                              firstIcon,
                              size: 25,
                            ),
                            if (count > 0)
                              Positioned(
                                bottom: 8,
                                left: 10,
                                child: Container(
                                  padding: const EdgeInsets.all(2),
                                  decoration: const BoxDecoration(
                                    color: Colors.red,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Text(
                                    count.toString(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                        onPressed: firstIconOnPressed,
                        color: primaryColor,
                      );
                    },
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
