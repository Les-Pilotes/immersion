import 'package:flutter/material.dart';
import 'package:immersion/src/utils/styles.dart';
import 'package:immersion/src/utils/ui_library/button/primary_button.dart';
import 'package:immersion/src/utils/ui_library/text/primary_page_title.dart';

class AssistantIntroScreen extends StatelessWidget {
  const AssistantIntroScreen({super.key});

  static const String routeName = "/assistant/new_chat";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back_ios_new_rounded),
                          color: primaryColor,
                          onPressed: () => Navigator.pop(context),
                        ),
                        const PrimaryPageTitle(
                          title: "Nouvelle discussion",
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "L'orientation, simplifiée",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      height: 22,
                    ),
                    const Icon(
                      Icons.sunny,
                      size: 16,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Exemples",
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                    /*
                    ListView.builder(
                      itemBuilder: (context, index) {
                        return exampleList[index];
                      },
                      itemCount: exampleList.length,
                    ),
                    */
                    const SizedBox(
                      height: 30,
                    ),
                    const ExampleTile(
                        text:
                        "Comment puis-je me préparer pour un entretien d'embauche ?",),
                    const SizedBox(
                      height: 30,
                    ),
                    const ExampleTile(
                        text:
                        "Quels sont les avantages de poursuivre des études supérieurs?",),
                    const SizedBox(
                      height: 30,
                    ),
                    const ExampleTile(
                        text:
                        "Comment puis-je faire pour trouver un emploi avec peu d'expériece professionnelle ?",),
                    const SizedBox(
                      height: 30,
                    ),
                    const ExampleTile(
                        text:
                        "Comment puis-je obtenir une bourse d'études pour poursuivre mes études ?",),
                    const SizedBox(
                      height: 30,
                    ),
                    const ExampleTile(
                        text:
                        "Comment puis-je trouver des investisseurs pour mon entreprise ?",),
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  PrimaryButton(
                    text: "Commencer",
                    onPressed: () {},
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ExampleTile extends StatelessWidget {
  const ExampleTile({
    required this.text, super.key,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Text(
          '"$text"',
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
