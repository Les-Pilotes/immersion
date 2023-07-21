import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:immersion/src/features/authentication/data/current_user_cubit.dart';
import 'package:immersion/src/features/authentication/data/firebase_constants.dart';
import 'package:immersion/src/features/authentication/domain/student_user_model.dart';
import 'package:immersion/src/features/authentication/presentation/screens/sign_in_screen.dart';
import 'package:immersion/src/features/authentication/presentation/screens/sign_up_registration.dart';
import 'package:immersion/src/features/home/presentation/home_navigation_screen.dart';
import 'package:immersion/src/utils/ui_library/button/primary_button.dart';
import 'package:immersion/src/utils/ui_library/button/secondary_button.dart';
import 'package:immersion/src/utils/ui_library/images/welcome_image_clipper.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  static const String routeName = "/";

  //region Navigation
  void navigateToSignIn(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute<SignInScreen>(
        builder: (context) => const SignInScreen(),
      ),
      (route) => false,
    );
  }

  void navigateToSignUp(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute<SignUpRegistrationScreen>(
        builder: (context) => const SignUpRegistrationScreen(),
      ),
      (route) => false,
    );
  }

  void navigateToHome(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute<SignUpRegistrationScreen>(
        builder: (context) => const HomeNavigationScreen(),
      ),
      (route) => false,
    );
  }

  void checkLoggedInUser(BuildContext context) {
    if (FirebaseInstances.firebaseAuthInstance.currentUser != null) {
      navigateToHome(context);
    }
  }

  void checkCurrentUser(BuildContext context) {
    if (FirebaseInstances.firebaseAuthInstance.currentUser != null) {
      final userId = FirebaseInstances.firebaseAuthInstance.currentUser!.uid;
      BlocProvider.of<CurrentUserCubit>(context).retrieveUser(userId);
    }
  }

  //endregion

  @override
  Widget build(BuildContext context) {
    checkCurrentUser(context);

    return BlocListener<CurrentUserCubit, StudentUser>(
      listener: (context, state) {
        if (state.id.isNotEmpty) {
          navigateToHome(context);
        }
      },
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: Stack(
                children: [
                  CustomShapeImage(
                    child: Transform.scale(
                      scale: 1.35,
                      child: Image.asset(
                        'assets/images/immersion_mla.png',
                        //fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 180,
                    right: 30,
                    bottom: 0,
                    child: Image.asset(
                      'assets/logo/app_prod_icon.png',
                      width: 150,
                      height: 150,
                      alignment: Alignment.center,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  const Expanded(
                    flex: 3,
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Les Pilotes",
                            style: TextStyle(
                              fontSize: 34,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Explorez de nouvelles opportunités, \ndéveloppez vos compétences et connectez-vous avec des professionnels grâce à notre application dédiée à l'emploi et à l'éducation.",
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF48484A),
                              letterSpacing: 0.5,
                              wordSpacing: 2,
                              height: 1.3,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        PrimaryButton(
                          text: "Connexion",
                          onPressed: () => navigateToSignIn(context),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SecondaryButton(
                          text: "Inscription",
                          onPressed: () => navigateToSignUp(context),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
