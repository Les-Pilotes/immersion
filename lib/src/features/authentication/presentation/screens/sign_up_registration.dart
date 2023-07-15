import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:immersion/src/features/authentication/presentation/screens/sign_in_screen.dart';
import 'package:immersion/src/features/authentication/presentation/screens/sign_up_informations.dart';
import 'package:immersion/src/utils/styles.dart';
import 'package:immersion/src/utils/ui_library/button/primary_button.dart';
import 'package:immersion/src/utils/ui_library/misc/number_circle.dart';
import 'package:immersion/src/utils/ui_library/text/pilotes_input_field.dart';
import 'package:immersion/src/utils/ui_library/text/primary_page_title.dart';
import 'package:immersion/src/utils/ui_library/text/suggestion_subtitle.dart';

class SignUpRegistrationScreen extends StatefulWidget {
  const SignUpRegistrationScreen({super.key});

  static const String routeName = "/signUp";

  @override
  State<SignUpRegistrationScreen> createState() =>
      _SignUpRegistrationScreenState();
}

class _SignUpRegistrationScreenState extends State<SignUpRegistrationScreen> {
  //region Variables
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _firstNameController;
  late final TextEditingController _lastNameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _passwordConfController;
  final _focusFirstName = FocusNode();
  final _focusLastName = FocusNode();
  final _focusEmail = FocusNode();
  final _focusPassword = FocusNode();
  final _focusConfPassword = FocusNode();

  //endregion

  //region Override Methods
  @override
  void initState() {
    super.initState();
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _passwordConfController = TextEditingController();
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _passwordConfController.dispose();
    super.dispose();
  }

  //endregion

  //region Navigation
  void navigateToSignIn(BuildContext context) {
    Navigator.of(context).pushReplacement(
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

  //endregion

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _focusFirstName.unfocus();
        _focusLastName.unfocus();
        _focusEmail.unfocus();
        _focusPassword.unfocus();
        _focusConfPassword.unfocus();
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 32,
                  ),
                  child: SingleChildScrollView(
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
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              PilotesInputField(
                                fieldHintText: "Prénom",
                                fieldName: 'firstName',
                                controller: _firstNameController,
                                currentNode: _focusFirstName,
                                nextNode: _focusLastName,
                                fieldActionType: TextInputAction.next,
                                validator: FormBuilderValidators.required(),
                              ),
                              Container(
                                height: 24,
                              ),
                              PilotesInputField(
                                fieldHintText: "Nom",
                                fieldName: 'lastName',
                                controller: _lastNameController,
                                currentNode: _focusLastName,
                                nextNode: _focusEmail,
                                fieldActionType: TextInputAction.next,
                                validator: FormBuilderValidators.required(),
                              ),
                              Container(
                                height: 22,
                              ),
                              PilotesInputField(
                                fieldHintText: "Adresse mail",
                                fieldName: 'email',
                                fieldIcon:
                                    const Icon(Icons.info_outline_rounded),
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
                                fieldName: "password",
                                fieldIcon:
                                    const Icon(Icons.remove_red_eye_rounded),
                                controller: _passwordController,
                                currentNode: _focusPassword,
                                nextNode: _focusConfPassword,
                                passwordField: true,
                                fieldActionType: TextInputAction.next,
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(),
                                  FormBuilderValidators.minLength(6),
                                ]),
                              ),
                              Container(
                                height: 24,
                              ),
                              PilotesInputField(
                                fieldHintText: "Confirmation mot de passe",
                                fieldName: 'confirmPassword',
                                fieldIcon:
                                    const Icon(Icons.remove_red_eye_rounded),
                                controller: _passwordConfController,
                                currentNode: _focusConfPassword,
                                passwordField: true,
                                fieldActionType: TextInputAction.done,
                                validator: FormBuilderValidators.compose(
                                  [
                                    FormBuilderValidators.required(),
                                    (val) {
                                      if (val != _passwordController.text) {
                                        return 'Les mots de passe ne correspondent pas';
                                      }
                                      return null;
                                    },
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  PrimaryButton(
                    text: 'Suivant',
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        navigateToSignUpInformation(context);
                      }
                    },
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
      ),
    );
  }
}
