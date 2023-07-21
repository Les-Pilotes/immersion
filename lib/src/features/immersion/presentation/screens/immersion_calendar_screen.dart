import 'package:flutter/material.dart';
import 'package:immersion/src/utils/ui_library/interface/bread_crumb_navigation_bar.dart';
import 'package:immersion/src/utils/ui_library/navigation/event_calendar_tab_bar.dart';

class ImmersionCalendarScreen extends StatelessWidget {
  const ImmersionCalendarScreen({super.key});

  static const String routeName = "/home/calendar";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 15),
            BreadCrumbNavigationBar(title: "Agenda"),
            SizedBox(
              height: 20,
            ),
            EventCalendarTabBar(),
          ],
        ),
      ),
    );
  }
}
