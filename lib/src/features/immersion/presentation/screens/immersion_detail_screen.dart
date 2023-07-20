import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:immersion/src/features/immersion/domain/event_model.dart';
import 'package:immersion/src/utils/ui_library/button/primary_button.dart';
import 'package:immersion/src/utils/ui_library/interface/bread_crumb_navigation_bar_with_icons.dart';

class ImmersionDetailScreen extends StatelessWidget {
  const ImmersionDetailScreen({
    required this.event,
    super.key,
  });

  static const String routeName = "/home/details";

  final Event event;

  void joinEvent() {
    Fluttertoast.showToast(
      msg: "Inscris à l'immersion",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16,
    );
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
                      const BreadCrumbNavigationBarIcons(
                        title: "Immersion",
                        firstIcon: Icons.favorite_border_rounded,
                        secondIcon: Icons.ios_share,
                      ),
                      Container(
                        height: 22,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(event.imageUrl),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                event.title,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 30,
                                ),
                              ),
                              Text("par ${event.organizerName}"),
                            ],
                          ),
                          Stack(
                            children: [
                              Container(
                                width: 46,
                                height: 46,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              Positioned.fill(
                                child: FractionallySizedBox(
                                  alignment: Alignment.center,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        event.eventMonthShort.toUpperCase(),
                                        style: const TextStyle(
                                          fontSize: 14,
                                          letterSpacing: 2,
                                        ),
                                      ),
                                      Text(
                                        //"04",
                                        event.eventDayNumber,
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w900,
                                          letterSpacing: 4,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.location_on_rounded, size: 12),
                              const SizedBox(width: 4),
                              Text(
                                event.address,
                                style: const TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 16,
                            child: Text(" • "),
                          ),
                          Row(
                            children: [
                              const Icon(Icons.access_time, size: 12),
                              const SizedBox(width: 4),
                              Text(
                                event.eventTimeRange,
                                style: const TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      const Text(
                        "À propos",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        event.description,
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      const SizedBox(height: 20),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          'asset/images/google_map_prop.png',
                          fit: BoxFit.cover,
                          height: 190,
                          width: 360,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Column(
              children: [
                PrimaryButton(
                  text: "Rejoindre",
                  onPressed: () => joinEvent(),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
