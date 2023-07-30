import 'package:flutter/material.dart';
import 'package:immersion/src/utils/ui_library/interface/bread_crumb_navigation_bar.dart';
import 'package:immersion/src/utils/ui_library/list/agenda_event_list.dart';

class ImmersionAgendaTab extends StatelessWidget {
  const ImmersionAgendaTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 15),
            BreadCrumbNavigationBar(title: "Agenda"),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 24,
                ),
                child: AgendaEventList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
