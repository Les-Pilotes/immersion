enum Preferences {
  art,
  communication,
  design,
  droit,
  enseignement,
  etudeCiv,
  histoire,
  information,
  ingenierie,
  langues,
  litterature,
  mathematiques,
  medecine,
  musique,
  professionsPedagogiques,
  sante,
  sciencesEnvironnement,
  sciencesReligions,
  sciencesEconomiques,
  sciencesNaturelles,
  sciencesSociales,
  sciencesTechniques,
  sport,
  theologie,
}

extension PreferencesExtension on Preferences {
  String get name {
    switch (this) {
      case Preferences.art:
        return "Art";
      case Preferences.communication:
        return "Communication";
      case Preferences.design:
        return "Design";
      case Preferences.droit:
        return "Droit";
      case Preferences.enseignement:
        return "Enseignement";
      case Preferences.etudeCiv:
        return "Étude des civilisations";
      case Preferences.histoire:
        return "Histoire";
      case Preferences.information:
        return "Information";
      case Preferences.ingenierie:
        return "Ingénierie";
      case Preferences.langues:
        return "Langues";
      case Preferences.litterature:
        return "Littérature";
      case Preferences.mathematiques:
        return "Mathématiques";
      case Preferences.medecine:
        return "Médecine";
      case Preferences.musique:
        return "Musique";
      case Preferences.professionsPedagogiques:
        return "Professions pédagogiques";
      case Preferences.sante:
        return "Santé";
      case Preferences.sciencesEnvironnement:
        return "Sciences de l’environnement";
      case Preferences.sciencesReligions:
        return "Sciences des religions";
      case Preferences.sciencesEconomiques:
        return "Sciences économiques";
      case Preferences.sciencesNaturelles:
        return "Sciences naturelles";
      case Preferences.sciencesSociales:
        return "Sciences sociales";
      case Preferences.sciencesTechniques:
        return "Sciences techniques";
      case Preferences.sport:
        return "Sport";
      case Preferences.theologie:
        return "Théologie";
    }
  }
}
