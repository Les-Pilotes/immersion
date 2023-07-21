import 'package:flutter/material.dart';
import 'package:immersion/src/utils/ui_library/list/event_tile.dart';

class ImmersionAgendaTab extends StatelessWidget {
  const ImmersionAgendaTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "Jeudi 21 Mars",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 10),
        EventTile(
          title: "Titre de l'article",
          date: "Date de publication",
          length: "Durée",
          theme: "Theme",
        ),
        EventTile(
          title: "Titre de l'article",
          date: "Date de publication",
          length: "Durée",
          theme: "Theme",
        ),
        SizedBox(
          height: 40,
        ),
        Text(
          "Samedi 29 Mars",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 10),
        EventTile(
          title: "Titre de l'article",
          date: "Date de publication",
          length: "Durée",
          theme: "Theme",
        ),
        SizedBox(
          height: 40,
        ),
        Text(
          "Mercredi 6 Avril",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 10),
        EventTile(
          title: "Titre de l'article",
          date: "Date de publication",
          length: "Durée",
          theme: "Theme",
        ),
        EventTile(
          title: "Titre de l'article",
          date: "Date de publication",
          length: "Durée",
          theme: "Theme",
        ),
        SizedBox(
          height: 40,
        ),
        Text(
          "Mercredi 13 Avril",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 10),
        EventTile(
          title: "Titre de l'article",
          date: "Date de publication",
          length: "Durée",
          theme: "Theme",
        ),
        EventTile(
          title: "Titre de l'article",
          date: "Date de publication",
          length: "Durée",
          theme: "Theme",
        ),
        EventTile(
          title: "Titre de l'article",
          date: "Date de publication",
          length: "Durée",
          theme: "Theme",
        ),
        EventTile(
          title: "Titre de l'article",
          date: "Date de publication",
          length: "Durée",
          theme: "Theme",
        ),
        EventTile(
          title: "Titre de l'article",
          date: "Date de publication",
          length: "Durée",
          theme: "Theme",
        ),
        EventTile(
          title: "Titre de l'article",
          date: "Date de publication",
          length: "Durée",
          theme: "Theme",
        ),
      ],
    );
  }
}
