// ignore_for_file: constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreString {
  static const String ENV_TEST = "Staging";
  static const String ENV_PROD = "Release";
  static const String ENV_DEMO = "Demo";
}

class FirebaseInstances {
  static final FirebaseFirestore firebaseFirestoreInstance =
      FirebaseFirestore.instance;
  static final FirebaseAuth firebaseAuthInstance = FirebaseAuth.instance;
}

class FirebaseUser {
  static final User? currentUser = FirebaseAuth.instance.currentUser;
}

class FirebasePaths {
  static const String ENV = FirestoreString.ENV_TEST;
  static const String USER_PATH = "Env/$ENV/User";
}

class Strings {
  Strings._();

  static const String title = "Immersion";
}
