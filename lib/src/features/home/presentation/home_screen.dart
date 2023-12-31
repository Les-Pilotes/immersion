import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:immersion/src/features/authentication/data/firebase_constants.dart';
import 'package:immersion/src/features/immersion/presentation/screens/calendar_tabs/immersion_agenda_tab.dart';
import 'package:immersion/src/features/immersion/presentation/screens/immersion_calendar_screen.dart';
import 'package:immersion/src/utils/constants.dart';
import 'package:immersion/src/utils/styles.dart';
import 'package:immersion/src/utils/ui_library/interface/simple_search_bar.dart';
import 'package:immersion/src/utils/ui_library/list/event_carousel.dart';
import 'package:immersion/src/utils/ui_library/text/primary_page_title.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String routeName = AppRoutes.routeNameHome;

  void navigateToEventCalendar(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<ImmersionCalendarScreen>(
        builder: (context) => const ImmersionCalendarScreen(),
      ),
    );
  }

  void navigateToAgenda(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<ImmersionAgendaTab>(
        builder: (context) => const ImmersionAgendaTab(),
      ),
    );
  }

  Future<int> getNumberOfUpcomingEvents() async {
    final QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection(
          FirebasePaths.eventPath,
        )
        .where('eventDate', isGreaterThanOrEqualTo: DateTime.now())
        .get();

    return snapshot.size;
  }

  @override
  Widget build(BuildContext context) {
    /*
    final List<ArticleTile> articleTitles = [
      const ArticleTile(
        title: "Titre de l'article",
        date: "Date de publication",
        length: "Durée",
        theme: "Theme",
      ),
      const ArticleTile(
        title: "Titre de l'article",
        date: "Date de publication",
        length: "Durée",
        theme: "Theme",
      ),
      const ArticleTile(
        title: "Titre de l'article",
        date: "Date de publication",
        length: "Durée",
        theme: "Theme",
      ),
      const ArticleTile(
        title: "Titre de l'article",
        date: "Date de publication",
        length: "Durée",
        theme: "Theme",
      ),
      const ArticleTile(
        title: "Titre de l'article",
        date: "Date de publication",
        length: "Durée",
        theme: "Theme",
      ),
      const ArticleTile(
        title: "Titre de l'article",
        date: "Date de publication",
        length: "Durée",
        theme: "Theme",
      ),
    ];
    */

    return Column(
      children: [
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          child: SimpleSearchBar(
            hintText: searchHintText,
          ),
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FutureBuilder(
                    future: getNumberOfUpcomingEvents(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const PrimaryPageTitle(title: 'À venir');
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        final int numberOfUpcomingEvents = snapshot.data ?? 0;
                        return PrimaryPageTitle(
                            title: 'À venir ($numberOfUpcomingEvents)');
                      }
                    },
                  ),
                  TextButton(
                    onPressed: () => navigateToAgenda(context),
                    child: const Text(
                      "Tout afficher",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 16,
                        color: primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              const EventCarousel(),
            ],
          ),
        ),
        const SizedBox(height: 24),
        /*Visibility(
          visible: false,
          child: Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const PrimaryPageTitle(title: "Actualités"),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Tout afficher",
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 16,
                            color: primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  ArticleCarousel(tiles: articleTitles),
                ],
              ),
            ),
          ),
        ),*/
      ],
    );
  }
}
