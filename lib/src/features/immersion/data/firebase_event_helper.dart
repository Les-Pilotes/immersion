import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:immersion/src/features/authentication/data/firebase_constants.dart';

class FirebaseEventHelper {
  final CollectionReference eventsCollection = FirebaseInstances
      .firebaseFirestoreInstance
      .collection(FirebasePaths.eventPath);

  Future<bool> isUserParticipant(String eventId) async {
    final user = FirebaseUser.currentUser;
    if (user != null) {
      final participantId = user.uid;
      final DocumentReference eventDocRef = eventsCollection.doc(eventId);
      final CollectionReference participantsCollection =
          eventDocRef.collection('Participants');

      final participantDocRef = participantsCollection.doc(participantId);
      final participantSnapshot = await participantDocRef.get();

      return participantSnapshot.exists;
    }
    return false;
  }

  Future<void> addParticipantToEvent(
    String eventId,
    String participantId,
  ) async {
    try {
      final DocumentReference eventDocRef = eventsCollection.doc(eventId);
      final CollectionReference participantsCollection =
          eventDocRef.collection('Participants');

      await participantsCollection.doc(participantId).set({
        'id': participantId,
      });
    } catch (e) {
      throw EventException('Error adding participant to event: $e');
    }
  }

  Future<void> removeParticipantFromEvent(
    String eventId,
    String participantId,
  ) async {
    try {
      final DocumentReference eventDocRef = eventsCollection.doc(eventId);
      final CollectionReference participantsCollection =
          eventDocRef.collection('Participants');

      await participantsCollection.doc(participantId).delete();
    } catch (e) {
      throw EventException('Error removing participant from event: $e');
    }
  }
}

class EventException implements Exception {
  EventException(this.message);

  final String message;
}
