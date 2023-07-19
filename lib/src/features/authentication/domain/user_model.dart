import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:immersion/src/features/authentication/domain/gender.dart';
import 'package:immersion/src/features/authentication/domain/school_level.dart';
import 'package:immersion/src/features/immersion/domain/event_model.dart';

class StudentUser {
  StudentUser({
    required this.id,
    required this.lastName,
    required this.firstName,
    required this.email,
  });

  factory StudentUser.fromFirebaseUser(
    User firebaseUser,
    String firstName,
    String lastName,
    StudentUser user,
  ) {
    return StudentUser(
      id: firebaseUser.uid,
      firstName: firstName,
      lastName: lastName,
      email: firebaseUser.email ?? '',
    ).copyWith(
      bio: user.bio,
      gender: user.gender,
      schoolLevel: user.schoolLevel,
      profileImageUrl: user.profileImageUrl,
      dateOfBirth: user.dateOfBirth,
      devices: user.devices,
      preferences: user.preferences,
      favoriteEvents: user.favoriteEvents,
      participationEvents: user.participationEvents,
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

  @override
  String toString() {
    return 'StudentUser('
        'id: $id, '
        'firstName: $firstName, '
        'lastName: $lastName, '
        'email: $email, '
        'bio: $bio, '
        'gender: $gender, '
        'schoolLevel: $schoolLevel, '
        'profileImageUrl: $profileImageUrl, '
        'dateOfBirth: $dateOfBirth, '
        'devices: $devices, '
        'preferences: $preferences, '
        'favoriteEvents: $favoriteEvents, '
        'participationEvents: $participationEvents, '
        'createdDate: $createdDate'
        ')';
  }

  late final String id;
  String firstName;
  String lastName;
  String email;
  String bio = '';
  Gender? gender;
  SchoolLevel? schoolLevel;
  String? profileImageUrl;
  DateTime? dateOfBirth;
  List<String>? devices;
  List<String>? preferences;
  List<Event>? favoriteEvents;
  List<Event>? participationEvents;
  final DateTime createdDate = DateTime.now();

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'bio': bio,
      'dateOfBirth': dateOfBirth,
      'gender': gender?.name,
      'schoolLevel': schoolLevel?.name,
      'preferences': preferences,
      'devices': devices,
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
    List<String>? preferences,
    List<Event>? favoriteEvents,
    List<Event>? participationEvents,
  }) {
    return StudentUser(
      id: id ?? this.id,
      lastName: lastName ?? this.lastName,
      firstName: firstName ?? this.firstName,
      email: email ?? this.email,
    )
      ..bio = bio ?? this.bio
      ..gender = gender ?? this.gender
      ..schoolLevel = schoolLevel ?? this.schoolLevel
      ..profileImageUrl = profileImageUrl ?? this.profileImageUrl
      ..dateOfBirth = dateOfBirth ?? this.dateOfBirth
      ..devices = devices ?? this.devices
      ..preferences = preferences ?? this.preferences
      ..favoriteEvents = favoriteEvents ?? this.favoriteEvents
      ..participationEvents = participationEvents ?? this.participationEvents;
  }
}
