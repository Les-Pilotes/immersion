import 'dart:async';
import 'package:flutter/material.dart';
import 'package:immersion/src/features/authentication/presentation/screens/welcome_screen.dart';
import 'app.dart';

FutureOr<void> main() async {
  runApp(
    const MaterialApp(
      title: 'Immersion',
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
    ),
  );
}
