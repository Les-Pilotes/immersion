import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:immersion/src/features/authentication/data/current_user_cubit.dart';
import 'package:immersion/src/features/authentication/presentation/screens/sign_in_screen.dart';
import 'package:immersion/src/features/authentication/presentation/screens/welcome_screen.dart';

import '../../../../../mock.dart';

void main() {
  setupFirebaseAuthMocks();

  setUpAll(() async {
    await Firebase.initializeApp();
  });

  testWidgets('WelcomeScreen displays UI elements and has proper navigation',
      (tester) async {
    //WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();

    await tester.pumpWidget(
      BlocProvider<CurrentUserCubit>(
        create: (context) => CurrentUserCubit(),
        child: const MaterialApp(
          home: WelcomeScreen(),
        ),
      ),
    );

    final columnFinder = find.byType(Column);
    final backgroundImageFinder = find.byWidgetPredicate(
      (widget) =>
          widget is Image &&
          widget.image == const AssetImage('assets/images/immersion_mla.png'),
    );
    final backgroundImageWidget = tester.widget<Image>(backgroundImageFinder);

    final titleFinder = find.text('Les Pilotes');
    final messageFinder = find.text(
      "Explorez de nouvelles opportunités, développez vos compétences et connectez-vous avec des professionnels grâce à notre application dédiée à l'emploi et à l'éducation.",
    );
    final primaryButtonFinder = find.text('Connexion');
    final secondaryButtonFinder = find.text('Inscription');

    expect(columnFinder, findsAtLeastNWidgets(2));
    expect(backgroundImageFinder, findsOneWidget);
    expect(
      backgroundImageWidget.image,
      const AssetImage('assets/images/immersion_mla.png'),
    );

    expect(titleFinder, findsOneWidget);
    expect(messageFinder, findsOneWidget);
    expect(primaryButtonFinder, findsOneWidget);
    expect(secondaryButtonFinder, findsOneWidget);

    await tester.tap(primaryButtonFinder);
    await tester.pumpAndSettle();

    expect(find.byType(SignInScreen), findsOneWidget);
  });
}
