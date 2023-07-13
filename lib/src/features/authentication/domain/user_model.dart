import 'package:firebase_auth/firebase_auth.dart';
import 'package:immersion/src/features/authentication/domain/gender.dart';
import 'package:immersion/src/features/authentication/domain/school_level.dart';
import 'package:immersion/src/features/authentication/domain/student_preferences.dart';
import 'package:immersion/src/features/immersion/domain/event_model.dart';

class StudentUser {
  StudentUser({
    required this.id,
    required this.lastName,
    required this.firstName,
    required this.email,
  });

  factory StudentUser.fromFirebaseUser(User firebaseUser) {
    return StudentUser(
      id: firebaseUser.uid,
      firstName: firebaseUser.displayName ?? '',
      lastName: firebaseUser.displayName ?? '',
      email: firebaseUser.email ?? '',
    );
  }

  late final String id;
  String firstName;
  String lastName;
  String email;
  late String bio;
  late Gender gender;
  late SchoolLevel schoolLevel;
  late String profileImageUrl;
  late DateTime dateOfBirth;
  late List<String> devices;
  late List<Preferences>? preferences;
  late List<Event>? favoriteEvents;
  late List<Event>? participationEvents;
  final DateTime createdDate = DateTime.now();

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      //'devices': devices,
      'createdDate': createdDate,
    };
  }

  String get fullName => "$firstName $lastName";
}
