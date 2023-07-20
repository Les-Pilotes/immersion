import 'package:flutter/material.dart';
import 'package:immersion/src/utils/ui_library/interface/profile_sub_section.dart';

class Section extends StatelessWidget {
  const Section({
    required this.title,
    super.key,
    this.subSections,
    this.description,
  });

  final String title;
  final List<SubSection>? subSections;
  final String? description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          color: Colors.grey[200],
          height: 36,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: const EdgeInsets.only(
                left: 20,
              ),
              child: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 0,
        ),
        if (subSections != null)
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: subSections!
                  .map(
                    (item) => Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 6,
                  ),
                  child: SubSection(
                    text: item.text,
                    leadingIcon: item.leadingIcon,
                  ),
                ),
              )
                  .toList(),
            ),
          )
        else
          Container(
            padding: const EdgeInsets.all(16),
            child: Text(
              description!,
              style: const TextStyle(fontSize: 18),
            ),
          ),
      ],
    );
  }
}
