import 'package:flutter/material.dart';
import 'package:immersion/src/features/immersion/presentation/screens/calendar_tabs/immersion_day_tab.dart';
import 'package:immersion/src/features/immersion/presentation/screens/calendar_tabs/immersion_month_tab.dart';
import 'package:immersion/src/utils/styles.dart';
import 'package:immersion/src/utils/ui_library/navigation/event_calendar_tab_bar_item.dart';

class EventCalendarTabBar extends StatefulWidget {
  const EventCalendarTabBar({super.key});

  @override
  State<EventCalendarTabBar> createState() => _EventCalendarTabBarState();
}

class _EventCalendarTabBarState extends State<EventCalendarTabBar> {
  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Stack(
          children: [
            Positioned.fill(
              top: 60,
              child: IndexedStack(
                index: _selectedTabIndex,
                children: const [
                  ImmersionMonthTab(),
                  ImmersionDayTab(),
                  /*SingleChildScrollView(
                    child: ImmersionAgendaTab(),
                  ),*/
                ],
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 40,
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: primaryColor),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: EventCalendarTabBarItem(
                        title: 'Mois',
                        index: 0,
                        isSelected: _selectedTabIndex == 0,
                        onTap: () {
                          setState(() {
                            _selectedTabIndex = 0;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: EventCalendarTabBarItem(
                        title: 'Jour',
                        index: 1,
                        isSelected: _selectedTabIndex == 1,
                        onTap: () {
                          setState(() {
                            _selectedTabIndex = 1;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: EventCalendarTabBarItem(
                        title: 'Agenda',
                        index: 2,
                        isSelected: _selectedTabIndex == 2,
                        onTap: () {
                          setState(() {
                            _selectedTabIndex = 2;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
