import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:immersion/src/features/authentication/data/firebase_constants.dart';
import 'package:immersion/src/features/immersion/domain/event_model.dart';
import 'package:immersion/src/features/immersion/presentation/screens/immersion_detail_screen.dart';
import 'package:immersion/src/utils/ui_library/list/event_card.dart';

class EventCarousel extends StatelessWidget {
  const EventCarousel({super.key});

  //region Navigation
  void navigateToEventDetails(BuildContext context, Event event) {
    Navigator.of(context).push(
      MaterialPageRoute<ImmersionDetailScreen>(
        builder: (context) => ImmersionDetailScreen(
          event: event,
        ),
      ),
    );
  }

  //endregion

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseInstances.firebaseFirestoreInstance
          .collection(FirebasePaths.eventPath)
          .where(
            'eventDate',
            isGreaterThan: DateTime.now().subtract(const Duration(days: 1)),
          )
          .orderBy('eventDate')
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }

        final List<DocumentSnapshot> documents = snapshot.data!.docs;

        final List<Widget> eventCards = documents.map((document) {
          final Event event = Event.fromDocumentSnapshot(document);

          return FutureBuilder<String>(
            future: event.eventNetworkUrl,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return const Text('Error loading image');
              } else {
                event.imageUrl = snapshot.data ?? '';
                return EventCard(
                  onPressed: () {
                    navigateToEventDetails(context, event);
                  },
                  event: event,
                );
              }
            },
          );
        }).toList();

        return SizedBox(
          height: 180,
          width: double.infinity,
          child: PageView(
            children: eventCards,
          ),
        );
      },
    );
  }
}
