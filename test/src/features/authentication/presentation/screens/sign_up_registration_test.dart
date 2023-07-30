import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:immersion/src/features/authentication/presentation/screens/sign_in_screen.dart';
import 'package:immersion/src/features/authentication/presentation/screens/sign_up_registration.dart';
import 'package:immersion/src/utils/ui_library/button/primary_button.dart';
import 'package:immersion/src/utils/ui_library/misc/number_circle.dart';
import 'package:immersion/src/utils/ui_library/text/pilotes_input_field.dart';
import 'package:immersion/src/utils/ui_library/text/suggestion_subtitle.dart';

void main() {
  testWidgets('Registration displaying fields and buttons', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: SignUpRegistrationScreen(),
      ),
    );

    expect(find.byType(PilotesInputField), findsNWidgets(5));
    expect(find.byType(NumberCircle), findsNWidgets(3));
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

  // TODO(amadoug2g): group 'Widget test'
  // TODO(amadoug2g): test 'Widget displaying'

  // TODO(amadoug2g): sub-group 'Form test'
  // TODO(amadoug2g): test 'Email already in use'
  // TODO(amadoug2g): test 'Email not valid'
  // TODO(amadoug2g): test 'Fields empty'
  // TODO(amadoug2g): test 'Name fields not valid'
  // TODO(amadoug2g): test 'Password too short'
  // TODO(amadoug2g): test 'Password not matching'

  // TODO(amadoug2g): group 'Navigation test'
  // TODO(amadoug2g): test 'Navigating to sign in'
  // TODO(amadoug2g): test 'Validating form & navigating to information sign up'
}
