import 'package:flutter/material.dart';
import 'package:immersion/src/features/authentication/presentation/screens/sign_up_preferences.dart';
import 'package:immersion/src/features/authentication/presentation/widgets/gender_selection.dart';
import 'package:immersion/src/features/authentication/presentation/widgets/school_level_selection.dart';
import 'package:immersion/src/utils/styles.dart';
import 'package:immersion/src/utils/ui_library/button/primary_button.dart';
import 'package:immersion/src/utils/ui_library/misc/number_circle.dart';
import 'package:immersion/src/utils/ui_library/text/pilotes_input_field.dart';
import 'package:immersion/src/utils/ui_library/text/primary_page_title.dart';

class SignUpInformationScreen extends StatefulWidget {
  const SignUpInformationScreen({super.key});

  static const String routeName = "/signUp/information";

  @override
  State<SignUpInformationScreen> createState() => _SignUpInformationScreenState();
}

class _SignUpInformationScreenState extends State<SignUpInformationScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  final _focusEmail = FocusNode();
  final _focusPassword = FocusNode();
  bool _isProcessing = false;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void navigateToSignUpPreference(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<SignUpPreferenceScreen>(
        builder: (context) => const SignUpPreferenceScreen(),
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
                          title: "Informations",
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
                                child: "2",
                                backgroundColor: darkColor,
                                textColor: Colors.white,
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
                    const Text("Entrez vos informations"),
                    Container(
                      height: 40,
                    ),
                    PilotesInputField(
                      fieldHintText: "Date de naissance",
                      fieldIcon: const Icon(Icons.calendar_month_rounded),
                      controller: _passwordController,
                      currentNode: _focusPassword,
                      fieldActionType: TextInputAction.next,
                    ),
                    Container(
                      height: 24,
                    ),
                    const Text("Je suis un.e"),
                    const GenderSelection(),
                    const Text("Niveau scolaire"),
                    const SchoolLevelSelection(),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                PrimaryButton(
                  text: "Suivant",
                  onPressed: () => navigateToSignUpPreference(context),
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
