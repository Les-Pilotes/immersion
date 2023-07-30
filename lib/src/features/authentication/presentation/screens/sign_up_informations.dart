import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:immersion/src/features/authentication/domain/gender.dart';
import 'package:immersion/src/features/authentication/domain/school_level.dart';
import 'package:immersion/src/features/authentication/presentation/screens/sign_up_preferences.dart';
import 'package:immersion/src/features/user/data/current_user_cubit.dart';
import 'package:immersion/src/utils/styles.dart';
import 'package:immersion/src/utils/ui_library/button/primary_button.dart';
import 'package:immersion/src/utils/ui_library/misc/number_circle.dart';
import 'package:immersion/src/utils/ui_library/text/pilotes_input_field.dart';
import 'package:immersion/src/utils/ui_library/text/primary_page_title.dart';
import 'package:intl/intl.dart';

class SignUpInformationScreen extends StatefulWidget {
  const SignUpInformationScreen({
    required this.password,
    super.key,
  });

  final String password;

  static const String routeName = "/signUp/information";

  @override
  State<SignUpInformationScreen> createState() =>
      _SignUpInformationScreenState();
}

class _SignUpInformationScreenState extends State<SignUpInformationScreen> {
  //region Variables
  final _formKey = GlobalKey<FormBuilderState>();
  late final TextEditingController _dobController;
  final _focusDob = FocusNode();
  late DateTime _selectedDOB;
  Gender? _selectedGender;
  SchoolLevel? _selectedSchoolLevel;

  //endregion

  //region Override Methods
  @override
  void initState() {
    super.initState();
    _dobController = TextEditingController();
  }

  @override
  void dispose() {
    _dobController.dispose();
    super.dispose();
  }

  //endregion

  //region State
  void addInfo(
    BuildContext context,
    DateTime dob,
    Gender gender,
    SchoolLevel level,
  ) {
    context.read<CurrentUserCubit>().addUserInfo(
          dob,
          gender,
          level,
        );
  }

  //endregion

  //region Navigation
  void navigateToSignUpPreference(BuildContext context, String password) {
    Navigator.of(context).push(
      MaterialPageRoute<SignUpPreferenceScreen>(
        builder: (context) => SignUpPreferenceScreen(password: password),
      ),
    );
  }

  //endregion

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(DateTime.now().year - 18, 1, 1),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      locale: const Locale('fr', 'FR'),
    );

    if (picked != null) {
      final String formattedDate = DateFormat('dd/MM/yyyy').format(picked);
      _selectedDOB = picked;
      _dobController.text = formattedDate;
    }
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
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              icon:
                                  const Icon(Icons.arrow_back_ios_new_rounded),
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
                        GestureDetector(
                          onTap: () => _selectDate(context),
                          child: AbsorbPointer(
                            child: PilotesInputField(
                              fieldHintText: "Date de naissance",
                              fieldName: 'dob',
                              fieldIcon:
                                  const Icon(Icons.calendar_month_rounded),
                              controller: _dobController,
                              currentNode: _focusDob,
                              fieldActionType: TextInputAction.next,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Entrez une date de naissance';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                        Container(
                          height: 24,
                        ),
                        const Text("Je suis un.e"),
                        StatefulBuilder(
                          builder:
                              (BuildContext context, StateSetter setState) {
                            return Column(
                              children: [
                                RadioListTile<Gender>(
                                  title: Text(Gender.male.name),
                                  value: Gender.male,
                                  groupValue: _selectedGender,
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedGender = value;
                                    });
                                  },
                                ),
                                RadioListTile<Gender>(
                                  title: Text(Gender.female.name),
                                  value: Gender.female,
                                  groupValue: _selectedGender,
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedGender = value;
                                    });
                                  },
                                ),
                              ],
                            );
                          },
                        ),
                        const Text("Niveau scolaire"),
                        StatefulBuilder(
                          builder:
                              (BuildContext context, StateSetter setState) {
                            return Column(
                              children: [
                                RadioListTile<SchoolLevel>(
                                  title: Text(SchoolLevel.college.name),
                                  value: SchoolLevel.college,
                                  groupValue: _selectedSchoolLevel,
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedSchoolLevel = value;
                                    });
                                  },
                                ),
                                RadioListTile<SchoolLevel>(
                                  title: Text(SchoolLevel.highSchool.name),
                                  value: SchoolLevel.highSchool,
                                  groupValue: _selectedSchoolLevel,
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedSchoolLevel = value;
                                    });
                                  },
                                ),
                                RadioListTile<SchoolLevel>(
                                  title: Text(SchoolLevel.higherEducation.name),
                                  value: SchoolLevel.higherEducation,
                                  groupValue: _selectedSchoolLevel,
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedSchoolLevel = value;
                                    });
                                  },
                                ),
                                RadioListTile<SchoolLevel>(
                                  title: Text(SchoolLevel.other.name),
                                  value: SchoolLevel.other,
                                  groupValue: _selectedSchoolLevel,
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedSchoolLevel = value;
                                    });
                                  },
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Column(
              children: [
                PrimaryButton(
                  text: "Suivant",
                  onPressed: () {
                    if (_dobController.text.isNotEmpty) {
                      if (_selectedGender != null) {
                        if (_selectedSchoolLevel != null) {
                          addInfo(
                            context,
                            _selectedDOB,
                            _selectedGender!,
                            _selectedSchoolLevel!,
                          );
                          navigateToSignUpPreference(context, widget.password);
                        } else {
                          showDialog<AlertDialog>(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Informations'),
                                content: const Text('Choississez un niveau'),
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
                      } else {
                        showDialog<AlertDialog>(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Informations'),
                              content: const Text('Choississez une option'),
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
                    } else {
                      showDialog<AlertDialog>(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Date de naissance'),
                            content: const Text('Entrez une date de naissance'),
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
