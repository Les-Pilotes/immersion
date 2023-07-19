import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:immersion/src/features/authentication/data/firebase_constants.dart';
import 'package:immersion/src/features/immersion/domain/event_model.dart';
import 'package:immersion/src/utils/ui_library/list/event_card.dart';

class FirebaseEventList extends StatelessWidget {
  const FirebaseEventList({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseInstances.firebaseFirestoreInstance.collection(FirebasePaths.EVENT_PATH).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }

        final List<DocumentSnapshot> documents = snapshot.data!.docs;

        return ListView.builder(
          itemCount: documents.length,
          itemBuilder: (context, index) {
            final Event event = Event.fromDocumentSnapshot(documents[index]);

            return EventCard(
              onPressed: () {
                debugPrint("Event: ${event.title}");
              },
              event: event,
            );
          },
        );
      },
    );
  }
}
