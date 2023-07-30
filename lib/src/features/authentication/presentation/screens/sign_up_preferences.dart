import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:immersion/src/features/user/data/current_user_cubit.dart';
import 'package:immersion/src/features/authentication/data/firebase_registration_helper.dart';
import 'package:immersion/src/features/authentication/domain/student_preferences.dart';
import 'package:immersion/src/features/home/presentation/home_navigation_screen.dart';
import 'package:immersion/src/utils/styles.dart';
import 'package:immersion/src/utils/ui_library/button/primary_button.dart';
import 'package:immersion/src/utils/ui_library/misc/number_circle.dart';
import 'package:immersion/src/utils/ui_library/text/primary_page_title.dart';

class SignUpPreferenceScreen extends StatefulWidget {
  const SignUpPreferenceScreen({
    required this.password,
    super.key,
  });

  final String password;

  @override
  State<SignUpPreferenceScreen> createState() => _SignUpPreferenceScreenState();
}

class _SignUpPreferenceScreenState extends State<SignUpPreferenceScreen> {
  //region Variables
  final List<String> selectedItems = [];
  List<Preferences> preferences = Preferences.values;
  Future<void>? signUpFuture;

  //endregion

  //region Form Validation
  void addPreferences(BuildContext context) {
    context.read<CurrentUserCubit>().addUserPreferences(
      getPreferencesFromSelected(selectedItems),
        );
  }

  List<String> getPreferencesFromSelected(List<String> selectedList) {
    final List<String> preferenceList = [];

    for (final item in selectedList) {
      for (final pref in Preferences.values) {
        if (item == pref.name) {
          preferenceList.add(pref.id);
        }
      }
    }

    return preferenceList;
  }

  Future<void> signUp(BuildContext context) async {
    addPreferences(context);
    try {
      await context.read<CurrentUserCubit>().signUpUser(
            widget.password,
          );

      if (mounted) {
        navigateToHome(context);
      }
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
          title: const Text('Adresse email'),
          content: Text('Une erreur est survenue: $e'),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
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
    Navigator.pushNamedAndRemoveUntil(
      context,
      HomeNavigationScreen.routeName,
      (route) => false,
    );
  }

  //endregion

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
                    Expanded(
                      child: StatefulBuilder(
                        builder: (BuildContext context, StateSetter setState) {
                          return ListView.builder(
                            itemCount: preferences.length,
                            itemBuilder: (context, index) {
                              final item = preferences[index];
                              final bool isSelected =
                                  selectedItems.contains(item.name);

                              return CheckboxListTile(
                                title: Text(item.name),
                                value: isSelected,
                                onChanged: (value) {
                                  setState(() {
                                    if (value != null && value) {
                                      selectedItems.add(item.name);
                                    } else {
                                      selectedItems.remove(item.name);
                                    }
                                  });
                                },
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                FutureBuilder(
                  future: signUpFuture,
                  builder: (context, snapshot) {
                    if (signUpFuture == null ||
                        snapshot.connectionState == ConnectionState.done) {
                      return PrimaryButton(
                        text: "S'inscrire",
                        onPressed: () async {
                          if (selectedItems.isNotEmpty) {
                            if (mounted) {
                              setState(() {
                                signUpFuture = signUp(context);
                              });
                            }
                          } else {
                            if (mounted) {
                              await showDialog<AlertDialog>(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('Préféremces'),
                                    content: const Text(
                                        'Choississez au moins 1 option',),
                                    actions: [
                                      TextButton(
                                        child: const Text('OK'),
                                        onPressed: () {
                                          Navigator.of(context)
                                              .pop(); // Close the dialog
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                          }
                        },
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
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
