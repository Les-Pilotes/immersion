import 'package:flutter/material.dart';
import 'package:immersion/src/features/assistant/presentation/screen/assistant_intro_screen.dart';
import 'package:immersion/src/utils/ui_library/interface/search_bar_with_icon.dart';

class AssistantDiscussionChatScreen extends StatelessWidget {
  const AssistantDiscussionChatScreen({super.key});

  static const String routeName = "/assistant";

  void navigateToAssistant(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<AssistantIntroScreen>(
        builder: (context) => const AssistantIntroScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add_rounded),
        onPressed: () => navigateToAssistant(context),
      ),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              SizedBox(height: 10),
              SearchBarWithIcon(hintText: 'Rechercher', icon: Icons.settings_rounded),
              SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}
