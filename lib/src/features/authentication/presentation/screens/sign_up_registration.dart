import 'package:flutter/material.dart';
import 'package:immersion/src/features/authentication/presentation/screens/sign_in_screen.dart';
import 'package:immersion/src/features/authentication/presentation/screens/sign_up_informations.dart';
import 'package:immersion/src/utils/styles.dart';
import 'package:immersion/src/utils/ui_library/button/primary_button.dart';
import 'package:immersion/src/utils/ui_library/misc/number_circle.dart';
import 'package:immersion/src/utils/ui_library/text/pilotes_input_field.dart';
import 'package:immersion/src/utils/ui_library/text/primary_page_title.dart';
import 'package:immersion/src/utils/ui_library/text/suggestion_subtitle.dart';

class SignUpRegistrationScreen extends StatelessWidget {
  const SignUpRegistrationScreen({super.key});

  static const String routeName = "/signUp";

  void navigateToSignIn(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<SignInScreen>(
        builder: (context) => const SignInScreen(),
      ),
    );
  }

  void navigateToSignUpInformation(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<SignUpInformationScreen>(
        builder: (context) => const SignUpInformationScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 32,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        PrimaryPageTitle(
                          title: "Inscription",
                        ),
                        Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              NumberCircle(
                                child: "1", // or Icons.check
                                backgroundColor: darkColor,
                                textColor: Colors.white,
                                radius: 14,
                              ),
                              SizedBox(width: 5),
                              NumberCircle(
                                child: "2",
                                backgroundColor: Colors.white,
                                textColor: darkColor,
                                radius: 14,
                              ),
                              SizedBox(width: 5),
                              NumberCircle(
                                child: "3",
                                backgroundColor: Colors.white,
                                textColor: darkColor,
                                radius: 14,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 22,
                    ),
                    const Text("Créé ton compte"),
                    Container(
                      height: 40,
                    ),
                    const PilotesInputField(
                      fieldHintText: "Prénom",
                    ),
                    Container(
                      height: 24,
                    ),
                    const PilotesInputField(
                      fieldHintText: "Nom",
                    ),
                    Container(
                      height: 22,
                    ),
                    const PilotesInputField(
                      fieldHintText: "Adresse mail",
                      fieldIcon: Icon(Icons.info_outline_rounded),
                    ),
                    Container(
                      height: 24,
                    ),
                    const PilotesInputField(
                      fieldHintText: "Mot de passe",
                      fieldIcon: Icon(Icons.remove_red_eye_rounded),
                    ),
                    Container(
                      height: 24,
                    ),
                    const PilotesInputField(
                      fieldHintText: "Confirmation mot de passe",
                      fieldIcon: Icon(Icons.remove_red_eye_rounded),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                PrimaryButton(
                  text: "Suivant",
                  onPressed: () => navigateToSignUpInformation(context),
                ),
                SuggestionSubtitle(
                  firstText: 'Déjà inscrit ?',
                  secondText: 'Connecte-toi',
                  onPressed: () => navigateToSignIn(context),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
