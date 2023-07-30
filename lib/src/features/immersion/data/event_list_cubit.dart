import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:immersion/src/features/authentication/data/firebase_constants.dart';
import 'package:immersion/src/features/authentication/domain/student_user_model.dart';
import 'package:immersion/src/features/immersion/domain/event_model.dart';

class EventListCubit extends Cubit<List<Event>> {
  EventListCubit() : super([]);

  Future<void> getEventList() async {
    final List<Event> eventList = [];

    final snapshot = await FirebaseInstances.firebaseFirestoreInstance
        .collection(FirebasePaths.eventPath)
        .get();

    snapshot.docs.map((document) {
      final Event event = Event.fromDocumentSnapshot(document);
      eventList.add(event);
    });

    emit(eventList);
  }

  void deleteEvent(String deletedEventId) {
    final List<Event> eventList = state;

    for (final event in eventList) {
      if (event.id == deletedEventId) {
        eventList.removeWhere((element) => element.id == deletedEventId);
      }
    }

    // TODO(amadoug2g): Update the event on Firebase

    emit(eventList);
  }

  void updateEvent(Event newEvent) {
    final List<Event> eventList = state;

    for (final event in eventList) {
      if (event.id == newEvent.id) {
        final eventIndex = eventList.indexOf(event);
        eventList
          ..removeWhere((element) => element.id == newEvent.id)
          ..insert(eventIndex, newEvent);
      }
    }

    // TODO(amadoug2g): Update the event on Firebase

    emit(eventList);
  }

  void addParticipant(StudentUser user, String participatingEventId) {
    final List<Event> eventList = state;

    for (final event in eventList) {
      if (event.id == participatingEventId) {
        event.participantList!.add(user.id);
      }
    }

    // TODO(amadoug2g): Update participation on Firebase

    emit(eventList);
  }

  void removeParticipant(StudentUser user, String participatingEventId) {
    final List<Event> eventList = state;

    for (final event in eventList) {
      if (event.id == participatingEventId) {
        for (final participant in event.participantList!) {
          event.participantList!
              .removeWhere((element) => participant == user.id);
        }
      }
    }

    // TODO(amadoug2g): Update participation on Firebase

    emit(eventList);
  }
}
