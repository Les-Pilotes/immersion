import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//import 'package:immersion/src/features/authentication/data/firebase_constants.dart';
import 'package:immersion/src/features/user/domain/student_user_model.dart';
import 'package:immersion/src/utils/ui_library/interface/bread_crumb_navigation_bar.dart';

class ImmersionParticipantScreen extends StatelessWidget {
  const ImmersionParticipantScreen({
    required this.eventId,
    super.key,
  });

  final String eventId;

  Future<List<String>> getParticipantsForEvent(String eventId) async {
    final CollectionReference participantsCollection =
    FirebaseFirestore.instance.collection('Env/Staging/Event/$eventId/Participants');

    final QuerySnapshot querySnapshot = await participantsCollection.get();

    final List<String> participantIds =
    querySnapshot.docs.map((doc) => doc.id).toList();

    return participantIds;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 24,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const BreadCrumbNavigationBar(
                        title: "Participants",
                      ),
                      Container(
                        height: 22,
                      ),
                      FutureBuilder<List<String>>(
                        future: getParticipantsForEvent(eventId),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return const CircularProgressIndicator();
                          }

                          if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          }

                          final List<String> participantIds = snapshot.data ?? [];

                          return SizedBox(
                            height: 180,
                            width: double.infinity,
                            child: ListView.builder(
                              itemCount: participantIds.length,
                              itemBuilder: (context, index) {
                                final participantId = participantIds[index];
                                return FutureBuilder<StudentUser>(
                                  future: StudentUser.fromUserId(participantId),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState == ConnectionState.waiting) {
                                      return const CircularProgressIndicator();
                                    }

                                    if (snapshot.hasError) {
                                      return const Text('Error loading student');
                                    }

                                    final studentUser = snapshot.data;
                                    return ListTile(
                                      title: Text(studentUser?.fullName ?? 'Unknown'),
                                      subtitle: Text(studentUser?.email ?? ''),
                                    );
                                  },
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
