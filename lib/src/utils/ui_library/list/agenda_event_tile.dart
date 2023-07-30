import 'package:flutter/material.dart';
import 'package:immersion/src/features/immersion/domain/event_model.dart';
import 'package:immersion/src/utils/styles.dart';

class AgendaEventTile extends StatelessWidget {
  const AgendaEventTile({
    required this.onPressed,
    required this.event,
    super.key,
  });

  final VoidCallback onPressed;
  final Event event;

  @override
  Widget build(BuildContext context) {
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
                      Text(
                        event.title,
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Row(
                        children: [
                          Text(event.formattedDate),
                          const Text(" • "),
                          Text(event.eventTimeRange),
                        ],
                      ),
                      Text(event.organizerName),
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
