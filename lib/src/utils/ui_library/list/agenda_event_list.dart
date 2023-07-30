import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:immersion/src/features/authentication/data/firebase_constants.dart';
import 'package:immersion/src/features/immersion/domain/event_model.dart';
import 'package:immersion/src/features/immersion/presentation/screens/immersion_detail_screen.dart';
import 'package:immersion/src/utils/ui_library/list/agenda_event_tile.dart';

class AgendaEventList extends StatelessWidget {
  const AgendaEventList({super.key});

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
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }

        final List<DocumentSnapshot> documents = snapshot.data!.docs;

        final Map<String, List<Event>> eventsByDate = {};

        for (final document in documents) {
          final Event event = Event.fromDocumentSnapshot(document);
          final String formattedDate = event
              .formattedDate;

          if (!eventsByDate.containsKey(formattedDate)) {
            eventsByDate[formattedDate] = [];
          }

          eventsByDate[formattedDate]!.add(event);
        }

        final List<Widget> eventList = eventsByDate.entries.map((entry) {
          final String date = entry.key;
          final List<Event> events = entry.value;

          return Column(
            children: [
              Container(
                height: 60,
                color: Colors.grey.shade100,
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  date,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: events.length,
                itemBuilder: (context, index) {
                  final Event event = events[index];
                  return AgendaEventTile(
                    onPressed: () {
                      navigateToEventDetails(context, event);
                    },
                    event: event,
                  );
                },
              ),
            ],
          );
        }).toList();

        return CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return eventList[index];
                },
                childCount: eventList.length,
              ),
            ),
          ],
        );
      },
    );
  }
}
