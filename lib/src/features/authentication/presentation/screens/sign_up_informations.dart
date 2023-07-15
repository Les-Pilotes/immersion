import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:immersion/src/features/authentication/domain/gender.dart';
import 'package:immersion/src/features/authentication/domain/school_level.dart';
import 'package:immersion/src/features/authentication/presentation/screens/sign_up_preferences.dart';
import 'package:immersion/src/utils/styles.dart';
import 'package:immersion/src/utils/ui_library/button/primary_button.dart';
import 'package:immersion/src/utils/ui_library/misc/number_circle.dart';
import 'package:immersion/src/utils/ui_library/text/pilotes_input_field.dart';
import 'package:immersion/src/utils/ui_library/text/primary_page_title.dart';
import 'package:intl/intl.dart';

class SignUpInformationScreen extends StatefulWidget {
  const SignUpInformationScreen({super.key});

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

  //region Navigation
  void navigateToSignUpPreference(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<SignUpPreferenceScreen>(
        builder: (context) => const SignUpPreferenceScreen(),
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
                    GestureDetector(
                      onTap: () => _selectDate(context),
                      child: AbsorbPointer(
                        child: PilotesInputField(
                          fieldHintText: "Date de naissance",
                          fieldName: 'dob',
                          fieldIcon: const Icon(Icons.calendar_month_rounded),
                          controller: _dobController,
                          currentNode: _focusDob,
                          fieldActionType: TextInputAction.next,
                        ),
                      ),
                    ),
                    Container(
                      height: 24,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          FormBuilderRadioGroup(
                            decoration: const InputDecoration(
                                labelText: 'Je suis un.e'),
                            name: 'gender',
                            validator: FormBuilderValidators.required(),
                            options: Gender.values
                                .map(
                                  (gender) => FormBuilderFieldOption(
                                      value: gender.name),
                                )
                                .toList(growable: false),
                          ),
                          FormBuilderRadioGroup(
                            decoration: const InputDecoration(
                                labelText: 'Niveau scolaire'),
                            name: 'schoolLevel',
                            validator: FormBuilderValidators.required(),
                            options: SchoolLevel.values
                                .map(
                                  (level) =>
                                      FormBuilderFieldOption(value: level.name),
                                )
                                .toList(growable: false),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                //amadou_g@hotmail.fr
                PrimaryButton(
                  text: "Suivant",
                  onPressed: () {
                    if (_formKey.currentState?.validate() == false) {
                      if (_dobController.text.isNotEmpty) {
                        navigateToSignUpPreference(context);
                      } else {
                        showDialog<AlertDialog>(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Date de naissance'),
                              content:
                                  const Text('Entrez une date de naissance'),
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
