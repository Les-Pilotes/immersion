import 'package:flutter/material.dart';
import 'package:immersion/src/utils/ui_library/button/secondary_button.dart';
import 'package:immersion/src/utils/ui_library/button/small_primary_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static const String routeName = "/home/profile";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
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
              const Text(
                'Jane Doe',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const Text(
                'Lycéenne | Pilotes',
                style: TextStyle(
                  fontSize: 18,
                  letterSpacing: 1,
                ),
              ),
              Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: SmallPrimaryButton(
                      text: "Éditer le profil", onPressed: () {},),),
              const SizedBox(height: 16),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Je suis une élève passionnée par la création artistique et le design, mais aussi les aspects juridiques et les langues étrangères.\n\nJ’aime également explorer le monde des sciences naturelles et comprendre comment les phénomènes qui nous entourent fonctionnent.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 16,
                    letterSpacing: 1,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              const Section(
                title: 'Centre(s) d’intérêt(s)',
                description: 'Design, Droit, Langues , Sciences naturelles',
              ),
              const Section(
                title: 'Contenu',
                subSections: [
                  SubSection(
                    text: "Favoris",
                    leadingIcon: Icons.favorite_border_rounded,
                  ),
                  SubSection(
                    text: "Participation",
                    leadingIcon: Icons.history_rounded,
                  ),
                ],
              ),
              const Section(
                title: 'Extra',
                subSections: [
                  SubSection(
                    text: "Feedback",
                    leadingIcon: Icons.feedback_rounded,
                  ),
                  SubSection(
                    text: "Mode Sombre",
                    leadingIcon: Icons.mode_night_rounded,
                  ),
                ],
              ),
              const Section(
                title: 'Paramètres',
                subSections: [
                  SubSection(
                    text: "Notifications",
                    leadingIcon: Icons.notifications_active_rounded,
                  ),
                  SubSection(
                    text: "Condition d'utilisation",
                    leadingIcon: Icons.document_scanner_rounded,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              SecondaryButton(text: "Déconnexion", onPressed: () {}),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class Section extends StatelessWidget {

  const Section({
    required this.title, super.key,
    this.subSections,
    this.description,
  });
  final String title;
  final List<SubSection>? subSections;
  final String? description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          color: Colors.grey[200],
          height: 36,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: const EdgeInsets.only(
                left: 20,
              ),
              child: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 0,
        ),
        if (subSections != null) Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: subSections!
                .map(
                  (item) => Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 6,
                ),
                child: SubSection(
                  text: item.text,
                  leadingIcon: item.leadingIcon,
                ),
              ),
            )
                .toList(),
          ),
        ) else Container(
          padding: const EdgeInsets.all(16),
          child: Text(
            description!,
            style: const TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }
}

class SubSection extends StatelessWidget {
  const SubSection({
    required this.text, super.key,
    this.leadingIcon,
  });

  final String text;
  final IconData? leadingIcon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Icon(
              leadingIcon,
              color: Colors.black,
            ),
            const SizedBox(
              width: 16,
            ),
            Text(
              text,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
        const Icon(
          Icons.arrow_forward_ios,
          size: 18,
          color: Colors.black,
        ),
      ],
    );
  }
}
