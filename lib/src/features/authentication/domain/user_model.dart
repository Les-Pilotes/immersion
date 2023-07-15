import 'package:cloud_firestore/cloud_firestore.dart';
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

  factory StudentUser.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data()! as Map<String, dynamic>;
    return StudentUser(
      id: data['id'] as String,
      firstName: data['firstName'] as String,
      lastName: data['lastName'] as String,
      email: data['email'] as String,
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
      'dateOfBirth': dateOfBirth,
      'gender': gender,
      'schoolLevel': schoolLevel,
      'preferences': preferences,
      //'devices': devices,
      'createdDate': createdDate,
    };
  }

  String get fullName => "$firstName $lastName";

  StudentUser copyWith({
    String? id,
    String? lastName,
    String? firstName,
    String? email,
    String? bio,
    Gender? gender,
    SchoolLevel? schoolLevel,
    String? profileImageUrl,
    DateTime? dateOfBirth,
    List<String>? devices,
    List<Preferences>? preferences,
    List<Event>? favoriteEvents,
    List<Event>? participationEvents,
    DateTime? createdDate,
  }) {
    return StudentUser(
      id: id ?? this.id,
      lastName: lastName ?? this.lastName,
      firstName: firstName ?? this.firstName,
      email: email ?? this.email,
    );
  }
}
