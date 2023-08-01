import 'package:flutter/material.dart';
import 'package:immersion/src/features/immersion/domain/event_model.dart';
import 'package:immersion/src/utils/styles.dart';

class AgendaEventTile extends StatelessWidget {
  const AgendaEventTile({
    required this.onPressed,
    required this.event,
    this.remaining,
    super.key,
  });

  final VoidCallback onPressed;
  final Event event;
  final String? remaining;

  @override
  Widget build(BuildContext context) {
    final bool isFutureEvent = event.eventDate.isAfter(DateTime.now());
    final bool showRemaining = isFutureEvent && remaining != null;

    return GestureDetector(
      onTap: () => onPressed(),
      child: Card(
        child: SizedBox(
          width: 360,
          height: 95,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: primaryColor,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Text(
                            event.title,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          if (showRemaining)
                            Text(
                              ' $remaining',
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                            ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(event.eventTimeRange),
                        ],
                      ),
                      Text("par ${event.organizerName}", style:
                        TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade500,
                        ),),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
