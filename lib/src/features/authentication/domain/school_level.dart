enum SchoolLevel {
  college,
  highSchool,
  higherEducation,
  other,
}

extension SchoolLevelExtension on SchoolLevel {
  String get name {
    switch (this) {
      case SchoolLevel.college:
        return 'Collège';
      case SchoolLevel.highSchool:
        return 'Lycée';
      case SchoolLevel.higherEducation:
        return 'Études supérieures';
      case SchoolLevel.other:
        return 'Autres';
    }
  }
}
