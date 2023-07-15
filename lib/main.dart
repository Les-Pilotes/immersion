import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:immersion/firebase_options.dart';
import 'package:immersion/src/features/authentication/data/current_user_cubit.dart';
import 'package:immersion/src/features/authentication/presentation/screens/welcome_screen.dart';
import 'package:immersion/src/features/home/presentation/home_navigation_screen.dart';

FutureOr<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);

  //WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();

  runApp(
    BlocProvider<CurrentUserCubit>(
      create: (context) => CurrentUserCubit(),
      child: MaterialApp(
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
    ),
  );
}
