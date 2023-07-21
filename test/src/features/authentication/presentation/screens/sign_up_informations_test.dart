import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:immersion/src/features/authentication/domain/gender.dart';
import 'package:immersion/src/features/authentication/domain/school_level.dart';
import 'package:immersion/src/features/authentication/presentation/screens/sign_up_informations.dart';
import 'package:immersion/src/utils/ui_library/button/primary_button.dart';
import 'package:immersion/src/utils/ui_library/misc/number_circle.dart';
import 'package:immersion/src/utils/ui_library/text/pilotes_input_field.dart';
import 'package:immersion/src/utils/ui_library/text/primary_page_title.dart';

void main () {
  group('Widget test', () {
    testWidgets('Widget displaying', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: SignUpInformationScreen(password: '',),
        ),
      );

      expect(find.byType(PrimaryPageTitle), findsOneWidget);
      expect(find.byType(NumberCircle), findsNWidgets(3));
      expect(find.byType(Form), findsOneWidget);
      expect(find.byType(PilotesInputField), findsOneWidget);
      expect(find.text(Gender.female.name), findsOneWidget);
      expect(find.text(Gender.male.name), findsOneWidget);
      expect(find.text(SchoolLevel.college.name), findsOneWidget);
      expect(find.text(SchoolLevel.highSchool.name), findsOneWidget);
      expect(find.text(SchoolLevel.higherEducation.name), findsOneWidget);
      expect(find.text(SchoolLevel.other.name), findsOneWidget);
      expect(find.byType(PrimaryButton), findsOneWidget);
    });
  });
}

// TODO(amadoug2g): group 'Widget test'
// TODO(amadoug2g): test 'Widget displaying'

// TODO(amadoug2g): sub-group 'Form validation'
// TODO(amadoug2g): test 'Error on empty date'
// TODO(amadoug2g): test 'Error on empty gender'
// TODO(amadoug2g): test 'Error on empty school level'

// TODO(amadoug2g): group 'Navigation test'
// TODO(amadoug2g): test 'Navigating to home'
// TODO(amadoug2g): test 'Navigating to information sign up'
