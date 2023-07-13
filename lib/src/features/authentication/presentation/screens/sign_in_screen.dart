import 'package:flutter/material.dart';
import 'package:immersion/src/features/authentication/presentation/screens/sign_up_registration.dart';
import 'package:immersion/src/features/home/presentation/home_navigation_screen.dart';
import 'package:immersion/src/utils/ui_library/button/primary_button.dart';
import 'package:immersion/src/utils/ui_library/text/pilotes_input_field.dart';
import 'package:immersion/src/utils/ui_library/text/primary_page_title.dart';
import 'package:immersion/src/utils/ui_library/text/suggestion_subtitle.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  static const String routeName = "/signIn";

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
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

  void navigateToHome(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute<SignUpRegistrationScreen>(
        builder: (context) => const HomeNavigationScreen(),
      ),
      (route) => false,
    );
  }

  void navigateToSignUp(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute<SignUpRegistrationScreen>(
        builder: (context) => const SignUpRegistrationScreen(),
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
                    const PrimaryPageTitle(
                      title: "Connexion",
                    ),
                    Container(
                      height: 22,
                    ),
                    const Text("Connecte-toi à ton compte"),
                    Container(
                      height: 79,
                    ),
                    PilotesInputField(
                      fieldHintText: "Adresse mail",
                      fieldIcon: const Icon(Icons.info_outline_rounded),
                      controller: _emailController,
                      currentNode: _focusEmail,
                      nextNode: _focusPassword,
                      fieldActionType: TextInputAction.next,
                    ),
                    Container(
                      height: 24,
                    ),
                    PilotesInputField(
                      fieldHintText: "Mot de passe",
                      fieldIcon: const Icon(Icons.info_outline_rounded),
                      controller: _passwordController,
                      currentNode: _focusPassword,
                      fieldActionType: TextInputAction.done,
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                PrimaryButton(
                  text: "Se connecter",
                  onPressed: () => navigateToHome(context),
                ),
                SuggestionSubtitle(
                  firstText: 'Pas de compte ?',
                  secondText: 'Inscris-toi',
                  onPressed: () => navigateToSignUp(context),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
