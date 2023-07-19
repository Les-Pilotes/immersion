enum Gender {
  female,
  male,
  undefined,
}

extension GenderExtension on Gender {
  String get name {
    switch (this) {
      case Gender.female:
        return 'Fille';
      case Gender.male:
        return 'Garçon';
      case Gender.undefined:
        return 'Non défini';
    }
  }
}
