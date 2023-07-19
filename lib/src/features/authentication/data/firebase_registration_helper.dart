import 'package:firebase_auth/firebase_auth.dart';
import 'package:immersion/src/features/authentication/data/firebase_constants.dart';

class FirebaseRegistrationHelper {
  static Future<User?> signUpUsingEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential userCredential = await FirebaseInstances
          .firebaseAuthInstance
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final User? user = userCredential.user;
      await user?.updateDisplayName(name);
      await user?.reload();
      return FirebaseInstances.firebaseAuthInstance.currentUser;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw AuthenticationException('Mot de passe trop faible');
      } else if (e.code == 'email-already-in-use') {
        throw AuthenticationException('Un compte existe déjà avec cet e-mail');
      } else {
        throw AuthenticationException(
            "Une erreur s'est produite lors de l'inscription, veuillez réessayer",);
      }
    } catch (e) {
      throw AuthenticationException(
          "Une erreur s'est produite lors de l'inscription, veuillez réessayer",);
    }
  }

  static Future<User?> signInUsingEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential userCredential = await FirebaseInstances
          .firebaseAuthInstance
          .signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw AuthenticationException(
            "Aucun utilisateur n'a été trouvé pour cet e-mail",);
      } else if (e.code == 'wrong-password') {
        throw AuthenticationException("Mot de passe incorrect");
      } else {
        throw AuthenticationException(
            "Une erreur s'est produite lors de la connexion, veuillez réessayer",);
      }
    }
  }

  static Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
  }
}

class AuthenticationException implements Exception {
  AuthenticationException(this.message);

  final String message;
}
