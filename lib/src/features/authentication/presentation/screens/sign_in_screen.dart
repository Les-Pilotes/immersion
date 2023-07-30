import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:immersion/src/features/authentication/data/firebase_registration_helper.dart';
import 'package:immersion/src/features/authentication/presentation/screens/sign_up_registration.dart';
import 'package:immersion/src/features/home/presentation/home_navigation_screen.dart';
import 'package:immersion/src/features/user/data/current_user_cubit.dart';
import 'package:immersion/src/utils/constants.dart';
import 'package:immersion/src/utils/ui_library/button/primary_button.dart';
import 'package:immersion/src/utils/ui_library/text/pilotes_input_field.dart';
import 'package:immersion/src/utils/ui_library/text/primary_page_title.dart';
import 'package:immersion/src/utils/ui_library/text/suggestion_subtitle.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  static const String routeName = AppRoutes.routeNameSignIn;

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  //region Variables
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  final _focusEmail = FocusNode();
  final _focusPassword = FocusNode();
  Future<void>? signInFuture;

  //endregion

  //region Override Methods
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

  //endregion

  //region Form Validation
  Future<void> signIn(BuildContext context) async {
    try {
      await context.read<CurrentUserCubit>().signInUser(
            _emailController.text,
            _passwordController.text,
          );
      if (mounted) navigateToHome(context);
    } on AuthenticationException catch (e) {
      displayEmailErrorMessage(e.message);
    } catch (error) {
      displayEmailErrorMessage(error.toString());
    }
  }

  void displayEmailErrorMessage(String e) {
    showDialog<AlertDialog>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(signInErrorText),
          content: Text(e),
          actions: [
            TextButton(
              child: Text(confirmationText),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  //endregion

  //region Navigation
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

  //endregion

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _focusEmail.unfocus();
        _focusPassword.unfocus();
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
                      children: [
                        Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              PrimaryPageTitle(
                                title: signInButtonText,
                              ),
                              Container(
                                height: 22,
                              ),
                              Text(signInSubtitleText),
                              Container(
                                height: 79,
                              ),
                              PilotesInputField(
                                fieldHintText: signInEmailText,
                                fieldName: 'email',
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
                                fieldHintText: signInPasswordText,
                                fieldName: 'password',
                                fieldIcon:
                                    const Icon(Icons.info_outline_rounded),
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
                      ],
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  FutureBuilder(
                    future: signInFuture,
                    builder: (context, snapshot) {
                      if (signInFuture == null || snapshot.connectionState == ConnectionState.done) {
                        return PrimaryButton(
                          text: signInText,
                          onPressed: () async {
                            if (_formKey.currentState?.validate() ?? false) {
                              setState(() {
                                signInFuture = signIn(context);
                              });
                            }
                          },
                        );
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                  SuggestionSubtitle(
                    firstText: signInNoAccountText1,
                    secondText: signInNoAccountText2,
                    onPressed: () => navigateToSignUp(context),
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
