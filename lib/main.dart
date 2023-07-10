import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:immersion/firebase_options.dart';
import 'package:immersion/src/features/authentication/presentation/screens/welcome_screen.dart';

FutureOr<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    const MaterialApp(
      title: 'Immersion',
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
    ),
  );
}
