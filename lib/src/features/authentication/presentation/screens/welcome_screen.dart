import 'package:flutter/material.dart';
import 'package:immersion/src/features/authentication/presentation/screens/sign_in_screen.dart';
import 'package:immersion/src/features/authentication/presentation/screens/sign_up_registration.dart';
import 'package:immersion/src/utils/ui_library/button/primary_button.dart';
import 'package:immersion/src/utils/ui_library/button/secondary_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  void navigateToSignIn(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<SignInScreen>(
        builder: (context) => const SignInScreen(),
      ),
    );
  }

  void navigateToSignUp(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<SignUpRegistrationScreen>(
        builder: (context) => const SignUpRegistrationScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                'assets/images/immersion_mla.png',
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 150,
                right: 0,
                bottom: 0,
                child: Image.asset(
                  'assets/logo/app_prod_icon.png',
                  width: 130,
                  height: 130,
                  alignment: Alignment.center,
                ),
              ),
            ],
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                          "Explorez de nouvelles opportunités, développez vos compétences et connectez-vous avec des professionnels grâce à notre application dédiée à l'emploi et à l'éducation.",
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
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
    );
  }
}
