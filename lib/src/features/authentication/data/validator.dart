import 'package:email_validator/email_validator.dart';

class Validator {
  static String? validateName({required String? name}) {
    if (name == null || name.isEmpty) {
      return "Le champ ne peut pas être vide";
    }
    return null;
  }

  static String? validateEmail({required String? email}) {
    if (email == null || email.isEmpty) {
      return "L'email ne peut pas être vide";
    }

    if (!EmailValidator.validate(email)) {
      return 'Veuillez entrer une adresse email valide';
    }

    return null;
  }

  static String? validatePassword({required String? password}) {
    if (password == null || password.isEmpty) {
      return "Le mot de passe ne peut pas être vide";
    }

    if (password.length < 6) {
      return "Veuillez entrer un mot de passe d'au moins 6 caractères";
    }

    return null;
  }
}
