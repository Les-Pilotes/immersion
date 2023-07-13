import 'package:flutter/material.dart';
import 'package:immersion/src/features/authentication/data/firebase_constants.dart';
import 'package:immersion/src/features/authentication/domain/user_model.dart';
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
  bool _isProcessing = false;

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

  Future<void> uploadUserToFirestore(StudentUser user) async {
    final userRef = FirebaseInstances.firebaseFirestoreInstance
        .collection(FirebasePaths.USER_PATH)
        .doc(user.id);
    await userRef.set(user.toMap());
  }

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
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              PilotesInputField(
                                fieldHintText: "Prénom",
                                controller: _firstNameController,
                                currentNode: _focusFirstName,
                                nextNode: _focusLastName,
                                fieldActionType: TextInputAction.next,
                              ),
                              Container(
                                height: 24,
                              ),
                              PilotesInputField(
                                fieldHintText: "Nom",
                                controller: _lastNameController,
                                currentNode: _focusLastName,
                                nextNode: _focusEmail,
                                fieldActionType: TextInputAction.next,
                              ),
                              Container(
                                height: 22,
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
                                fieldIcon: const Icon(Icons.remove_red_eye_rounded),
                                controller: _passwordController,
                                currentNode: _focusPassword,
                                nextNode: _focusConfPassword,
                                fieldActionType: TextInputAction.next,
                              ),
                              Container(
                                height: 24,
                              ),
                              PilotesInputField(
                                fieldHintText: "Confirmation mot de passe",
                                fieldIcon: const Icon(Icons.remove_red_eye_rounded),
                                controller: _passwordConfController,
                                currentNode: _focusConfPassword,
                                fieldActionType: TextInputAction.done,
                              ),
                            ],
                          ),
                        ),
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
      ),
    );

    /*
    GestureDetector(
      onTap: () {
        _focusFirstName.unfocus();
        _focusLastName.unfocus();
        _focusEmail.unfocus();
        _focusPassword.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Sign Up'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFormField(
                        controller: _firstNameController,
                        focusNode: _focusFirstName,
                        textInputAction: TextInputAction.next,
                        validator: (value) => Validator.validateName(
                          name: value,
                        ),
                        onFieldSubmitted: (v) {
                          FocusScope.of(context).requestFocus(_focusLastName);
                        },
                        decoration: const InputDecoration(
                          labelText: 'First Name',
                        ),
                      ),
                      TextFormField(
                        controller: _lastNameController,
                        focusNode: _focusLastName,
                        textInputAction: TextInputAction.next,
                        validator: (value) => Validator.validateName(
                          name: value,
                        ),
                        onFieldSubmitted: (v) {
                          FocusScope.of(context).requestFocus(_focusEmail);
                        },
                        decoration: const InputDecoration(
                          labelText: 'Last Name',
                        ),
                      ),
                      TextFormField(
                        controller: _emailController,
                        focusNode: _focusEmail,
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (v) {
                          FocusScope.of(context).requestFocus(_focusPassword);
                        },
                        decoration: const InputDecoration(
                          labelText: 'Email',
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) => Validator.validateEmail(
                          email: value,
                        ),
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        controller: _passwordController,
                        focusNode: _focusPassword,
                        textInputAction: TextInputAction.done,
                        validator: (value) => Validator.validatePassword(
                          password: value,
                        ),
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          hintText: 'Enter your password',
                          suffixIcon: Icon(Icons.lock),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 24),
                      if (_isProcessing)
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 50),
                          child: const CircularProgressIndicator(),
                        )
                      else
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () async {
                                  setState(() {
                                    _isProcessing = true;
                                  });
                                  if (_formKey.currentState!.validate()) {
                                    final user =
                                        await FirebaseRegistrationHelper
                                            .registerUsingEmailPassword(
                                      name:
                                          "${_firstNameController.text} ${_lastNameController.text}",
                                      email: _emailController.text,
                                      password: _passwordController.text,
                                    );
                                    setState(() {
                                      _isProcessing = false;
                                    });
                                    if (user != null) {
                                      await uploadUserToFirestore(
                                        LazyCookUser.fromFirebaseUser(user),
                                      );

                                      navigateToMain(context);
                                    }
                                  } else {
                                    setState(() {
                                      _isProcessing = false;
                                    });
                                  }
                                },
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.deepOrangeAccent),
                                ),
                                child: const Text(
                                  'Sign up',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
              TextButton(
                onPressed: () => navigateToLogin(context),
                child: const Text("Have an account? Log in"),
              ),
            ],
          ),
        ),
      ),
    );
    */
  }
}
