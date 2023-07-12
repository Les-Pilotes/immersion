import 'package:intl/intl.dart';

class Event {
  Event({
    required this.name,
    required this.address,
    required this.imageUrl,
    required this.eventDate,
    required this.eventType,
    required this.duration,
    required this.lat,
    required this.lng,
    required this.organizerName,
    this.description =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
  });

  final String id = "";
  final String name;
  String description;
  final EventType eventType;
  final String address;
  final String imageUrl;
  final DateTime eventDate;
  final Duration duration;
  final DateTime creationDate = DateTime.now();
  final double lat;
  final double lng;
  final String organizerName;

  String get eventTimeRange {
    final DateTime endTime = eventDate.add(duration);
    final String startTimeFormatted = DateFormat.Hm().format(eventDate);
    final String endTimeFormatted = DateFormat.Hm().format(endTime);
    return '$startTimeFormatted - $endTimeFormatted';
  }

  String get eventMonthShort {
    final String fullMonth = DateFormat.MMMM('fr_FR').format(eventDate);
    return fullMonth.substring(0, 3).toLowerCase();
  }

  String get eventDayFull {
    return DateFormat.EEEE('fr_FR').format(eventDate);
  }

  String get eventDayNumber {
    return DateFormat.d('fr_FR').format(eventDate);
  }
}

enum EventType {
  immersion,
  impulsion,
  leBonCreneau,
  salonDeLorientation,
  eventFeminin,
  masterclass,
  demoDay,
}

enum EventStatus {
  opened,
  closed,
  reservation,
}
