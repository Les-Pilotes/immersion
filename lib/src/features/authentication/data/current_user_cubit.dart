import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:immersion/src/features/authentication/data/firebase_constants.dart';
import 'package:immersion/src/features/authentication/data/firebase_registration_helper.dart';
import 'package:immersion/src/features/authentication/domain/gender.dart';
import 'package:immersion/src/features/authentication/domain/school_level.dart';
import 'package:immersion/src/features/authentication/domain/student_preferences.dart';
import 'package:immersion/src/features/authentication/domain/user_model.dart';

class CurrentUserCubit extends Cubit<StudentUser> {
  CurrentUserCubit()
      : super(
          StudentUser(
            id: "",
            lastName: "",
            firstName: "",
            email: "",
          ),
        );

  void initiateUser(
    String id,
    String firstName,
    String lastName,
    String email,
  ) {
    final updatedUser = state.copyWith(
      id: id,
      firstName: firstName,
      lastName: lastName,
      email: email,
    );
    emit(updatedUser);
  }

  void addInfo(DateTime dob, Gender genre, SchoolLevel schoolLevel) {
    final updatedUser = state.copyWith(
      dateOfBirth: dob,
      gender: genre,
      schoolLevel: schoolLevel,
    );
    emit(updatedUser);
  }

  void addPreferences(List<Preferences> preferences) {
    final updatedUser = state.copyWith(preferences: preferences);
    emit(updatedUser);
  }

  Future<void> signUpUser(StudentUser user, String password) async {
    // Perform the registration logic, e.g., create a user in Firebase Authentication
    // Once the registration is successful, you can update the user details in the cubit

    await FirebaseRegistrationHelper
        .registerUsingEmailPassword(
      name: user.fullName,
      email: user.email,
      password: password,
    );

    final userRef = FirebaseInstances.firebaseFirestoreInstance
        .collection(FirebasePaths.USER_PATH)
        .doc(user.id);
    await userRef.set(user.toMap());

    emit(user);
  }

  Future<void> signInUser(StudentUser user, String password) async {
    // Perform the registration logic, e.g., create a user in Firebase Authentication
    // Once the registration is successful, you can update the user details in the cubit

    await FirebaseRegistrationHelper
        .signInUsingEmailPassword(
      email: user.email,
      password: password,
    );

    final userRef = FirebaseInstances.firebaseFirestoreInstance
        .collection(FirebasePaths.USER_PATH)
        .doc(user.id);
    await userRef.set(user.toMap());

    emit(user);
  }

  Future<void> updateUser(StudentUser user) async {
    // Perform the logic to update the user's data, e.g., update user details in Firestore
    // After updating the user, you can emit the updated state in the cubit
    emit(user);
  }

  Future<void> deleteUser(String userId) async {
    // Perform the logic to delete the user, e.g., delete user data from Firestore and Firebase Authentication
    // Once the user is deleted, you can update the state in the cubit to indicate that the user is no longer signed in
    emit(StudentUser(id: '', lastName: '', firstName: '', email: ''));
  }

  Future<void> retrieveUser() async {
    //TODO: Replace with fetching user from Firestore using user id

    final User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      emit(StudentUser.fromFirebaseUser(user));
    }
  }
}
