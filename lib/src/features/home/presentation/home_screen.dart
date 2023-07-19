import 'package:flutter/material.dart';
import 'package:immersion/src/features/immersion/domain/event_model.dart';
import 'package:immersion/src/utils/styles.dart';
import 'package:immersion/src/utils/ui_library/interface/search_bar_with_icon.dart';
import 'package:immersion/src/utils/ui_library/list/event_card.dart';
import 'package:immersion/src/utils/ui_library/list/event_carousel.dart';
import 'package:immersion/src/utils/ui_library/list/firebase_event_list.dart';
import 'package:immersion/src/utils/ui_library/text/primary_page_title.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String routeName = "/home";

  static final immersionJobTeaser = Event(
    title: "Immersion",
    address: "19 Rue Blanche, 75009 Paris",
    imageUrl: "assets/images/immersion_jobteaser.jpg",
    eventDate: DateTime(
      2023,
      1,
      18,
      14,
      0,
    ),
    eventType: EventType.immersion,
    duration: const Duration(hours: 3),
    lat: 48.87914192357721,
    lng: 2.331286428835271,
    organizerName: "JobTeaser",
    description:
        "Bienvenue à la visite d'entreprise de JobTeaser ! Lors de cette journée, les étudiants et "
        "lycéens auront l'occasion de découvrir le programme passionnant que nous avons préparé spécialement pour eux. "
        "Ils auront l'opportunité de rencontrer notre équipe dynamique composée de professionnels expérimentés "
        "dans le domaine de l'orientation professionnelle et du recrutement."
        "\n\nAu cours de cette visite, ils pourront en apprendre davantage sur notre plateforme innovante qui vise à "
        "connecter les étudiants et les entreprises, facilitant ainsi leur transition vers le monde du travail. "
        "Ils auront également la possibilité de poser des questions, d'explorer nos locaux modernes et inspirants, "
        "et d'échanger avec des collaborateurs passionnés et motivés. \n\nCette visite chez JobTeaser promet d'être une expérience "
        "enrichissante et stimulante, offrant un aperçu concret du monde professionnel et des opportunités qui les attendent.",
  );

  static final immersionPowder = Event(
    title: "Immersion",
    address: "19 Rue Blanche, 75009 Paris",
    imageUrl: "assets/images/immersion_jobteaser.jpg",
    eventDate: DateTime(
      2023,
      1,
      18,
      14,
      0,
    ),
    eventType: EventType.immersion,
    duration: const Duration(hours: 3),
    lat: 48.87914192357721,
    lng: 2.331286428835271,
    organizerName: "JobTeaser",
    description:
        "Bienvenue à la visite d'entreprise de JobTeaser ! Lors de cette journée, les étudiants et "
        "lycéens auront l'occasion de découvrir le programme passionnant que nous avons préparé spécialement pour eux. "
        "Ils auront l'opportunité de rencontrer notre équipe dynamique composée de professionnels expérimentés "
        "dans le domaine de l'orientation professionnelle et du recrutement."
        "\n\nAu cours de cette visite, ils pourront en apprendre davantage sur notre plateforme innovante qui vise à "
        "connecter les étudiants et les entreprises, facilitant ainsi leur transition vers le monde du travail. "
        "Ils auront également la possibilité de poser des questions, d'explorer nos locaux modernes et inspirants, "
        "et d'échanger avec des collaborateurs passionnés et motivés. \n\nCette visite chez JobTeaser promet d'être une expérience "
        "enrichissante et stimulante, offrant un aperçu concret du monde professionnel et des opportunités qui les attendent.",
  );

  static final immersionStationF = Event(
    title: "Immersion",
    address: "19 Rue Blanche, 75009 Paris",
    imageUrl: "assets/images/immersion_jobteaser.jpg",
    eventDate: DateTime(
      2023,
      1,
      18,
      14,
      0,
    ),
    eventType: EventType.immersion,
    duration: const Duration(hours: 3),
    lat: 48.87914192357721,
    lng: 2.331286428835271,
    organizerName: "JobTeaser",
    description:
        "Bienvenue à la visite d'entreprise de JobTeaser ! Lors de cette journée, les étudiants et "
        "lycéens auront l'occasion de découvrir le programme passionnant que nous avons préparé spécialement pour eux. "
        "Ils auront l'opportunité de rencontrer notre équipe dynamique composée de professionnels expérimentés "
        "dans le domaine de l'orientation professionnelle et du recrutement."
        "\n\nAu cours de cette visite, ils pourront en apprendre davantage sur notre plateforme innovante qui vise à "
        "connecter les étudiants et les entreprises, facilitant ainsi leur transition vers le monde du travail. "
        "Ils auront également la possibilité de poser des questions, d'explorer nos locaux modernes et inspirants, "
        "et d'échanger avec des collaborateurs passionnés et motivés. \n\nCette visite chez JobTeaser promet d'être une expérience "
        "enrichissante et stimulante, offrant un aperçu concret du monde professionnel et des opportunités qui les attendent.",
  );

  /*
  void navigateToEventDetails(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ImmersionDetailScreen(
          event: immersionJobTeaser,
        ),
      ),
    );
  }

  void navigateToEventCalendar(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const ImmersionCalendarScreen(),
      ),
    );
  }

  void navigateToProfile(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const ProfileScreen(),
      ),
    );
  }

  void navigateToAssistant(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const AssistantIntroScreen(),
      ),
    );
  }

  void navigateToMessages(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const ListMessageScreen(),
      ),
    );
  }

  void navigateToNews(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const ListMessageScreen(),
      ),
    );
  }
  */

  @override
  Widget build(BuildContext context) {
    final List<EventCard2> immersionTiles = [
      EventCard2(
        imageUrl: 'assets/images/immersion_powder.jpg',
        title: 'IMMERSION | Powder',
        subtitle: '14h00 - 17h00',
        thirdText: 'Mer. 21 Sept. 2022',
        onPressed: () {},
        //=> navigateToEventDetails(context),
      ),
      EventCard2(
        imageUrl: 'assets/images/immersion_jobteaser.jpg',
        title: 'IMMERSION | JobTeaser',
        subtitle: '14h00 - 17h00',
        thirdText: 'Mer. 15 Jan. 2023',
        onPressed: () {},
        //=> navigateToEventDetails(context),
      ),
      EventCard2(
        imageUrl: 'assets/images/immersion_stationf.jpg',
        title: 'IMMERSION | StationF',
        subtitle: '14h00 - 17h00',
        thirdText: 'Mer. 04 Mai 2022',
        onPressed: () {},
        //=> navigateToEventDetails(context),
      ),
    ];

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
          child: SearchBarWithIcon(
            hintText: 'Rechercher',
            icon: Icons.message_rounded,
            function: () {
              //navigateToMessages(context);
            },
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
                  const PrimaryPageTitle(title: "Événements"),
                  TextButton(
                    onPressed: () {},
                    //=> navigateToEventCalendar(context),
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
              EventCarousel2(tiles: immersionTiles),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Container(
          padding: const EdgeInsets.all(20),
          height: 400,
          child: const FirebaseEventList(),
        ),
        /*
        Expanded(
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
        */
      ],
    );
  }
}
