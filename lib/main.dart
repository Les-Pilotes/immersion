import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:immersion/src/features/authentication/presentation/screens/welcome_screen.dart';
import 'package:immersion/src/features/home/presentation/home_navigation_screen.dart';

FutureOr<void> main() async {
  //await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);

  runApp(
    MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('fr', 'FR'),
      ],
      title: 'Immersion',
      debugShowCheckedModeBanner: false,
      initialRoute: WelcomeScreen.routeName,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case WelcomeScreen.routeName:
            return MaterialPageRoute(builder: (_) => const WelcomeScreen());
          case HomeNavigationScreen.routeName:
            return MaterialPageRoute(
              builder: (_) => const HomeNavigationScreen(),
            );
          default:
            return MaterialPageRoute(builder: (_) => const WelcomeScreen());
        }
      },
    ),
  );
}
