import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class ImmersionMonthTab extends StatelessWidget {
  const ImmersionMonthTab({super.key});

  @override
  Widget build(BuildContext context) {
    return TableCalendar<TableCalendar>(
      firstDay: DateTime.utc(2010, 10, 16),
      lastDay: DateTime.utc(2030, 3, 14),
      focusedDay: DateTime.now(),
      calendarFormat: CalendarFormat.month,
      locale: 'fr_FR',
      headerStyle: const HeaderStyle(formatButtonVisible: false),
      startingDayOfWeek: StartingDayOfWeek.monday,
    );
  }
}
