// ignore_for_file: constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:immersion/flavors.dart';

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
  static String flavorEnv = F.env;
  static String userPath = "Env/$flavorEnv/User";
  static String eventPath = "Env/$flavorEnv/Event";
}

class Strings {
  Strings._();

  static const String title = "Immersion";
}
