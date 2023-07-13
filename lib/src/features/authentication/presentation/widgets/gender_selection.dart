import 'package:flutter/material.dart';
import 'package:immersion/src/features/authentication/domain/gender.dart';

class GenderSelection extends StatefulWidget {
  const GenderSelection({super.key});

  @override
  State<GenderSelection> createState() => _GenderSelectionState();
}

class _GenderSelectionState extends State<GenderSelection> {
  Gender? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RadioListTile<Gender>(
          title: const Text('Garçon'),
          value: Gender.male,
          groupValue: selectedGender,
          onChanged: (value) {
            setState(() {
              selectedGender = value;
            });
          },
        ),
        RadioListTile<Gender>(
          title: const Text('Fille'),
          value: Gender.female,
          groupValue: selectedGender,
          onChanged: (value) {
            setState(() {
              selectedGender = value;
            });
          },
        ),
      ],
    );
  }
}
