import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:form_builder_validators/localization/l10n.dart';
import 'package:immersion/firebase_options.dart';
import 'package:immersion/src/features/authentication/presentation/screens/welcome_screen.dart';
import 'package:immersion/src/features/home/presentation/home_navigation_screen.dart';
import 'package:immersion/src/features/user/data/current_user_cubit.dart';
import 'package:immersion/src/utils/constants.dart';

FutureOr<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  //WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();

  runApp(
    BlocProvider<CurrentUserCubit>(
      create: (context) => CurrentUserCubit(),
      child: MaterialApp(
        supportedLocales: const [
          //Locale('en', 'US'),
          Locale('fr', 'FR'),
        ],
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          FormBuilderLocalizations.delegate,
        ],
        title: appTitleText,
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
    ),
  );
}
