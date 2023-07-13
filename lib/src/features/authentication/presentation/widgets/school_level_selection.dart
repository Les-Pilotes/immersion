import 'package:flutter/material.dart';
import 'package:immersion/src/features/authentication/domain/school_level.dart';

class SchoolLevelSelection extends StatefulWidget {
  const SchoolLevelSelection({super.key});

  @override
  State<SchoolLevelSelection> createState() => _SchoolLevelSelectionState();
}

class _SchoolLevelSelectionState extends State<SchoolLevelSelection> {
  SchoolLevel? selectedSchoolLevel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RadioListTile<SchoolLevel>(
          title: const Text('Collège'),
          value: SchoolLevel.college,
          groupValue: selectedSchoolLevel,
          onChanged: (value) {
            setState(() {
              selectedSchoolLevel = value;
            });
          },
        ),
        RadioListTile<SchoolLevel>(
          title: const Text('Lycée'),
          value: SchoolLevel.highSchool,
          groupValue: selectedSchoolLevel,
          onChanged: (value) {
            setState(() {
              selectedSchoolLevel = value;
            });
          },
        ),
        RadioListTile<SchoolLevel>(
          title: const Text('Études supérieures'),
          value: SchoolLevel.higherEducation,
          groupValue: selectedSchoolLevel,
          onChanged: (value) {
            setState(() {
              selectedSchoolLevel = value;
            });
          },
        ),
        RadioListTile<SchoolLevel>(
          title: const Text('Autres'),
          value: SchoolLevel.other,
          groupValue: selectedSchoolLevel,
          onChanged: (value) {
            setState(() {
              selectedSchoolLevel = value;
            });
          },
        ),
      ],
    );
  }
}
