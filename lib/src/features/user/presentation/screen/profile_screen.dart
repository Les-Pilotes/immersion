import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:immersion/src/features/user/data/current_user_cubit.dart';
import 'package:immersion/src/features/authentication/domain/student_user_model.dart';
import 'package:immersion/src/features/authentication/presentation/screens/welcome_screen.dart';
import 'package:immersion/src/utils/extension.dart';
import 'package:immersion/src/utils/ui_library/button/secondary_button.dart';
import 'package:immersion/src/utils/ui_library/button/small_primary_button.dart';
import 'package:immersion/src/utils/ui_library/interface/profile_section.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  static const String routeName = "/home/profile";

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  //region Navigation
  void navigateToHome(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute<WelcomeScreen>(
        builder: (context) => const WelcomeScreen(),
      ),
          (route) => false,
    );
  }

  Future<void> logOut(BuildContext context) async {
    await context.read<CurrentUserCubit>().logOutUser();
    if (mounted) {
      navigateToHome(context);
    }
  }
  //endregion

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentUserCubit, StudentUser>(
      builder: (context, currentUser) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    children: [
                      const SizedBox(height: 40),
                      const Center(
                        child: CircleAvatar(
                          radius: 70,
                          backgroundColor: Colors.red,
                          //backgroundImage: AssetImage('your_image_path'),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        currentUser.fullName,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        '${currentUser.schoolLevel!.name.capitalize()} | Pilotes',
                        style: const TextStyle(
                          fontSize: 18,
                          letterSpacing: 1,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        child: SmallPrimaryButton(
                          text: "Éditer le profil",
                          onPressed: () {},
                        ),
                      ),
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          currentUser.bio,
                          textAlign: TextAlign.justify,
                          style: const TextStyle(
                            fontSize: 16,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                      Section(
                        title: 'Centre(s) d’intérêt(s)',
                        description: currentUser.formattedPreferencesList,
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                  SecondaryButton(text: "Déconnexion", onPressed: () {
                    logOut(context);
                  },)
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
