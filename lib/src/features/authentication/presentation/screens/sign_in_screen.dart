import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
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
                child: Form(
                  key: _formKey,
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
                        fieldName: 'email',
                        fieldIcon: const Icon(Icons.info_outline_rounded),
                        controller: _emailController,
                        currentNode: _focusEmail,
                        nextNode: _focusPassword,
                        fieldActionType: TextInputAction.next,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.email(),
                        ]),
                      ),
                      Container(
                        height: 24,
                      ),
                      PilotesInputField(
                        fieldHintText: "Mot de passe",
                        fieldName: 'password',
                        fieldIcon: const Icon(Icons.info_outline_rounded),
                        controller: _passwordController,
                        currentNode: _focusPassword,
                        passwordField: true,
                        fieldActionType: TextInputAction.done,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.minLength(6),
                        ]),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Column(
              children: [
                PrimaryButton(
                  text: "Se connecter",
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      // TODO(amadoug2g): check that the user actually exists in DB
                      // TODO(amadoug2g): hide the button when processing signing in/up
                      navigateToHome(context);
                    }
                  },
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
