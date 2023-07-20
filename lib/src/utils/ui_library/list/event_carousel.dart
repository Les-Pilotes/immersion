import 'package:flutter/material.dart';
import 'package:immersion/src/utils/ui_library/list/event_card.dart';

class EventCarousel extends StatelessWidget {
  const EventCarousel({
    required this.tiles,
    super.key,
  });

  final List<EventCard2> tiles;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      width: double.infinity,
      child: PageView(
        children: tiles,
      ),
    );
  }
}
