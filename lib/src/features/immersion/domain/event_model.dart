import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:immersion/src/features/authentication/data/firebase_constants.dart';
import 'package:immersion/src/utils/extension.dart';
import 'package:intl/intl.dart';

class Event {
  Event({
    required this.title,
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

  factory Event.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    //final String eventId = snapshot.id;
    final String eventName = snapshot.get('title') as String;
    final String eventAddress = snapshot.get('address') as String;
    final String eventImageUrl = snapshot.get('imageUrl') as String;
    final DateTime eventDate = (snapshot.get('eventDate') as Timestamp).toDate();
    final EventType eventType = getEventTypeFromString(snapshot.get('eventType') as String);
    final Duration eventDuration = getDuration(snapshot.get('duration') as String);
    final double eventLat = snapshot.get('lat') as double;
    final double eventLng = snapshot.get('lng') as double;
    final String eventOrganizerName = snapshot.get('organizerName') as String;

    return Event(
      title: eventName,
      address: eventAddress,
      imageUrl: eventImageUrl,
      eventDate: eventDate,
      eventType: eventType,
      duration: eventDuration,
      lat: eventLat,
      lng: eventLng,
      organizerName: eventOrganizerName,
    );
  }

  final String id = "";
  String title;
  String description;
  final EventType eventType;
  String address;
  String imageUrl;
  DateTime eventDate;
  Duration duration;
  final DateTime creationDate = DateTime.now();
  double lat;
  double lng;
  String organizerName;
  String? videoUrl;

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

  String get formattedDate {
    final String dayFull = eventDayFull.substring(0, 3).capitalize();
    final String dayNumber = eventDayNumber;
    final String monthShort = eventMonthShort;
    final String year = DateFormat.y('fr_FR').format(eventDate);

    return '$dayFull. $dayNumber $monthShort. $year';
  }

  Future<Duration> retrieveDuration() async {
    final DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance.collection('your_collection').doc('your_document').get();

    final int durationInMillis = documentSnapshot.get('duration') as int;
    final Duration duration = Duration(milliseconds: durationInMillis);

    return duration;
  }

  static Duration getDuration(String eventDuration) {
    final int durationInMillis = int.parse(eventDuration);
    final Duration duration = Duration(milliseconds: durationInMillis);

    return duration;
  }

  static EventType getEventTypeFromString(String eventTypeString) {
    switch (eventTypeString) {
      case 'immersion':
        return EventType.immersion;
      case 'impulsion':
        return EventType.impulsion;
      case 'leBonCreneau':
        return EventType.leBonCreneau;
      case 'salonDeLorientation':
        return EventType.salonDeLorientation;
      case 'eventFeminin':
        return EventType.eventFeminin;
      case 'masterclass':
        return EventType.masterclass;
      case 'demoDay':
        return EventType.demoDay;
      default:
        throw Exception('Unsupported eventTypeString: $eventTypeString');
    }
  }

  Future<String> get eventNetworkUrl1 async {
    final formattedUrl = imageUrl.substring(imageUrl.indexOf('Env'));

    final ref = FirebaseInstances.firebaseStorageInstance.ref().child(formattedUrl).getDownloadURL();

    return ref;
  }

  Future<String> get eventNetworkUrl async {
    if (imageUrl.startsWith('Env')) {
      return imageUrl; // Return the existing URL if it starts with "Env"
    } else {
      final formattedUrl = imageUrl.substring(imageUrl.indexOf('Env'));
      final ref = FirebaseInstances.firebaseStorageInstance.ref().child(formattedUrl).getDownloadURL();
      return ref;
    }
  }


  int get durationToMilliseconds => duration.inMilliseconds;

  Event copyWith({
    String? title,
    String? address,
    String? imageUrl,
    DateTime? eventDate,
    EventType? eventType,
    Duration? duration,
    double? lat,
    double? lng,
    String? organizerName,
    String? description,
  }) {
    return Event(
      title: title ?? this.title,
      address: address ?? this.address,
      imageUrl: imageUrl ?? this.imageUrl,
      eventDate: eventDate ?? this.eventDate,
      eventType: eventType ?? this.eventType,
      duration: duration ?? this.duration,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      organizerName: organizerName ?? this.organizerName,
      description: description ?? this.description,
    );
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
  live,
  reservation,
}
