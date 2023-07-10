import 'package:flutter/material.dart';

class HomeNavigationScreen extends StatelessWidget {
  const HomeNavigationScreen({super.key});

  static const String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Text("Home"),
        ),
      ),
    );
  }
}
