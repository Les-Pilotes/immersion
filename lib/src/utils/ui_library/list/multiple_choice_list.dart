import 'package:flutter/material.dart';
import 'package:immersion/src/features/authentication/domain/student_preferences.dart';

class MultipleChoiceList extends StatefulWidget {
  const MultipleChoiceList({super.key});

  @override
  State<MultipleChoiceList> createState() => _MultipleChoiceListState();
}

class _MultipleChoiceListState extends State<MultipleChoiceList> {
  List<String> selectedItems = [];

  final List<Preferences> preferences = Preferences.values;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: preferences.length,
      itemBuilder: (context, index) {
        final item = preferences[index];
        final bool isSelected = selectedItems.contains(item.name);

        return CheckboxListTile(
          title: Text(item.name),
          value: isSelected,
          onChanged: (value) {
            setState(() {
              if (value != null && value) {
                selectedItems.add(item.name);
              } else {
                selectedItems.remove(item.name);
              }
            });
          },
        );
      },
    );
  }
}
