import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:immersion/src/features/authentication/presentation/screens/sign_in_screen.dart';
import 'package:immersion/src/features/authentication/presentation/screens/sign_up_registration.dart';
import 'package:immersion/src/utils/ui_library/button/primary_button.dart';
import 'package:immersion/src/utils/ui_library/text/pilotes_input_field.dart';
import 'package:immersion/src/utils/ui_library/text/suggestion_subtitle.dart';

void main() {
  testWidgets('Registration displaying fields and buttons', (tester) async {
    // Build our SignUpRegistrationScreen with a MaterialApp
    await tester.pumpWidget(
      const MaterialApp(
        home: SignUpRegistrationScreen(),
      ),
    );

    expect(find.byType(PilotesInputField), findsNWidgets(5));
    expect(find.byType(Form), findsOneWidget);
    expect(find.byType(PrimaryButton), findsOneWidget);
    expect(find.byType(SuggestionSubtitle), findsOneWidget);
  });

  testWidgets('Navigating to sign in', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: SignUpRegistrationScreen(),
      ),
    );

    await tester.tap(find.byType(SuggestionSubtitle));
    await tester.pumpAndSettle();

    expect(find.byType(SignInScreen), findsOneWidget);
  });

}
