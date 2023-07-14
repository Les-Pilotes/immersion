import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:immersion/src/features/authentication/data/firebase_constants.dart';

class FirebaseRegistrationHelper {
  static Future<User?> registerUsingEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    User? user;
    try {
      final UserCredential userCredential = await FirebaseInstances
          .firebaseAuthInstance
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
      await user!.updateDisplayName(name);
      await user.reload();
      user = FirebaseInstances.firebaseAuthInstance.currentUser;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        debugPrint('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        debugPrint('The account already exists for that email.');
      }
    } catch (e) {
      debugPrint(e.toString());
    }

    return user;
  }

  static Future<User?> signInUsingEmailPassword({
    required String email,
    required String password,
  }) async {
    User? user;
    try {
      final UserCredential userCredential = await FirebaseInstances
          .firebaseAuthInstance
          .signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        debugPrint('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        debugPrint('Wrong password provided.');
      }
    }

    return user;
  }

  static Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
