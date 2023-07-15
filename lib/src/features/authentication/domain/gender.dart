enum Gender {
  female,
  male,
}

extension GenderExtension on Gender {
  String get name {
    switch (this) {
      case Gender.female:
        return 'Fille';
      case Gender.male:
        return 'Garçon';
    }
  }
}
