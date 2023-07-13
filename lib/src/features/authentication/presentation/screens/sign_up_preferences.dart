import 'package:flutter/material.dart';
import 'package:immersion/src/features/home/presentation/home_navigation_screen.dart';
import 'package:immersion/src/utils/styles.dart';
import 'package:immersion/src/utils/ui_library/button/primary_button.dart';
import 'package:immersion/src/utils/ui_library/list/multiple_choice_list.dart';
import 'package:immersion/src/utils/ui_library/misc/number_circle.dart';
import 'package:immersion/src/utils/ui_library/text/primary_page_title.dart';

class SignUpPreferenceScreen extends StatelessWidget {
  const SignUpPreferenceScreen({super.key});

  //static const String routeName = "/signUp/information/preference";

  void navigateToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      HomeNavigationScreen.routeName,
      (route) => false,
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
                  vertical: 8,
                  horizontal: 24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back_ios_new_rounded),
                          color: primaryColor,
                          onPressed: () => Navigator.pop(context),
                        ),
                        const PrimaryPageTitle(
                          title: "Préférences",
                        ),
                        const Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              NumberCircle(
                                child: Icons.check,
                                backgroundColor: Colors.white,
                                textColor: darkColor,
                                radius: 14,
                              ),
                              SizedBox(width: 5),
                              NumberCircle(
                                child: Icons.check,
                                backgroundColor: Colors.white,
                                textColor: darkColor,
                                radius: 14,
                              ),
                              SizedBox(width: 5),
                              NumberCircle(
                                child: "3",
                                backgroundColor: darkColor,
                                textColor: Colors.white,
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
                    const Text(
                      "Choississez 1 ou plusieurs domaines qui vous intéressent :",
                    ),
                    Container(
                      height: 40,
                    ),
                    const Expanded(child: MultipleChoiceList()),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                PrimaryButton(
                  text: "S'inscrire",
                  onPressed: () => navigateToHome(context),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
