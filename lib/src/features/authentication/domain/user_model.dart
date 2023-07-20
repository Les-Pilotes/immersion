import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:immersion/src/features/authentication/domain/gender.dart';
import 'package:immersion/src/features/authentication/domain/school_level.dart';
import 'package:immersion/src/features/immersion/domain/event_model.dart';
import 'package:immersion/src/utils/extension.dart';

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
    //final data = snapshot.data()! as Map<String, dynamic>;
    return StudentUser(
      //id: data['id'] as String,
      id: snapshot.get('id') as String,
      firstName: snapshot.get('firstName') as String,
      lastName: snapshot.get('lastName') as String,
      email: snapshot.get('email') as String,
    ).copyWith(
      bio: snapshot.get('bio') as String,
      gender: StudentUser.getGenderFromString(snapshot.get('gender') as String),
      schoolLevel: StudentUser.getSchoolLevelFromString(snapshot.get('schoolLevel') as String),
      profileImageUrl: snapshot.get('email') as String,
      dateOfBirth: (snapshot.get('dateOfBirth') as Timestamp).toDate(),
      devices: (snapshot.get('devices') as List<String>?) ?? [],
      preferences: (snapshot.get('preferences') as List<dynamic>).cast<String>(),
      //favoriteEvents: snapshot.get('favoriteEvents') as List<Event>,
      //participationEvents: snapshot.get('participationEvents') as List<Event>,
      createdDate: (snapshot.get('createdDate') as Timestamp).toDate(),
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
  DateTime createdDate = DateTime.now();

  // TODO(amadoug2g): Add sub-collections for favorites and participation, or id lists for each
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
      //'favoriteEvents': favoriteEvents,
      //'participationEvents': participationEvents,
      'devices': devices,
      'createdDate': createdDate,
    };
  }

  String get fullName => "$firstName $lastName";

  static Gender getGenderFromString(String genderString) {
    switch (genderString) {
      case 'Fille':
        return Gender.female;
      case 'Garçon':
        return Gender.male;
      case 'Non défini':
        return Gender.undefined;
      default:
        throw Exception('Unsupported genderString: $genderString');
    }
  }

  static SchoolLevel getSchoolLevelFromString(String schoolLevelString) {
    switch (schoolLevelString) {
      case 'Collège':
        return SchoolLevel.college;
      case 'Lycée':
        return SchoolLevel.highSchool;
      case 'Études supérieures':
        return SchoolLevel.higherEducation;
      case 'Autres':
        return SchoolLevel.other;
      default:
        throw Exception('Unsupported schoolLevelString: $schoolLevelString');
    }
  }

  String get formattedPreferencesList {
    preferences.toString();

    final List<String> result = [];

    for (final pref in preferences!) {
      result.add(pref.capitalize());
    }

    return result.toString().substring(1, result.toString().length-1);
  }

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
    DateTime? createdDate,
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
      ..createdDate = createdDate ?? this.createdDate
      ..devices = devices ?? this.devices
      ..preferences = preferences ?? this.preferences
      ..favoriteEvents = favoriteEvents ?? this.favoriteEvents
      ..participationEvents = participationEvents ?? this.participationEvents;
  }
}
