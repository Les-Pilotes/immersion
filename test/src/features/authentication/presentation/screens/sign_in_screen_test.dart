import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:immersion/src/features/authentication/presentation/screens/sign_in_screen.dart';
import 'package:immersion/src/features/authentication/presentation/screens/sign_up_registration.dart';
import 'package:immersion/src/features/home/presentation/home_screen.dart';
import 'package:immersion/src/utils/ui_library/button/primary_button.dart';
import 'package:immersion/src/utils/ui_library/text/pilotes_input_field.dart';
import 'package:immersion/src/utils/ui_library/text/suggestion_subtitle.dart';

void main() {
  testWidgets('Sign In show all widgets', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: SignInScreen(),
      ),
    );

    final pageTitle = find.text('Connexion');
    final pageSubtitle = find.text('Connecte-toi à ton compte');
    final connexionButton = find.byType(PrimaryButton);
    final suggestionButton = find.byType(SuggestionSubtitle);

    expect(pageTitle, findsOneWidget);
    expect(pageSubtitle, findsOneWidget);

    expect(connexionButton, findsOneWidget);
    expect(suggestionButton, findsOneWidget);

    expect(find.byType(PilotesInputField), findsNWidgets(2));
    expect(find.byType(Form), findsOneWidget);
  });

  testWidgets('Navigating to sign up', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: SignInScreen(),
      ),
    );

    await tester.tap(find.byType(SuggestionSubtitle));
    await tester.pumpAndSettle();

    expect(find.byType(SignUpRegistrationScreen), findsOneWidget);
  });

  testWidgets('Empty fields submission staying on sign in', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: SignInScreen(),
      ),
    );

    await tester.tap(find.byType(PrimaryButton));
    await tester.pumpAndSettle();

    expect(find.byType(HomeScreen), findsNothing);
    expect(find.byType(SignInScreen), findsOneWidget);
  });

  // TODO(amadoug2g): group 'Widget test'

  // TODO(amadoug2g): sub-group 'Form test'
  // TODO(amadoug2g): test 'Email not registered'
  // TODO(amadoug2g): test 'Fields empty'
  // TODO(amadoug2g): test 'Wrong password'

  // TODO(amadoug2g): group 'Navigation test'
  // TODO(amadoug2g): test 'Navigating to home'
  // TODO(amadoug2g): test 'Navigating to registration sign up'
}
