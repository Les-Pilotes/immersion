import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class ImmersionDayTab extends StatelessWidget {
  const ImmersionDayTab({super.key});

  @override
  Widget build(BuildContext context) {
    return TableCalendar<TableCalendar>(
      firstDay: DateTime.utc(2010, 10, 16),
      lastDay: DateTime.utc(2030, 3, 14),
      focusedDay: DateTime.now(),
      calendarFormat: CalendarFormat.week,
      locale: 'fr_FR',
      startingDayOfWeek: StartingDayOfWeek.monday,
      headerStyle: const HeaderStyle(formatButtonVisible: false),
    );
  }
}
