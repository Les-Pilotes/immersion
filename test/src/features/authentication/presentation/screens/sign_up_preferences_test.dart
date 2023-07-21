import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:immersion/src/features/authentication/presentation/screens/sign_up_preferences.dart';
import 'package:immersion/src/utils/ui_library/button/primary_button.dart';
import 'package:immersion/src/utils/ui_library/misc/number_circle.dart';
import 'package:immersion/src/utils/ui_library/text/primary_page_title.dart';

void main() {
  group('Widget test', () {
    testWidgets('Widget displaying', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: SignUpPreferenceScreen(
            password: '',
          ),
        ),
      );

      expect(find.byType(PrimaryPageTitle), findsOneWidget);
      expect(find.byType(NumberCircle), findsNWidgets(3));
      expect(find.byType(ListView), findsOneWidget);

      await tester.pumpAndSettle();
      expect(find.byType(PrimaryButton), findsOneWidget);
    });
  });
}

// TODO(amadoug2g): group 'Widget test'
// TODO(amadoug2g): test 'Widget displaying'
// TODO(amadoug2g): test 'Error on empty selection'

// TODO(amadoug2g): group 'Navigation test'
// TODO(amadoug2g): test 'Navigating to home'
// TODO(amadoug2g): test 'Navigating to information sign up'
