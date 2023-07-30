import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:immersion/src/features/immersion/data/firebase_event_helper.dart';
import 'package:immersion/src/features/immersion/domain/event_model.dart';
import 'package:immersion/src/features/user/data/current_user_cubit.dart';
import 'package:immersion/src/utils/ui_library/button/primary_button.dart';
import 'package:immersion/src/utils/ui_library/interface/bread_crumb_navigation_bar_with_icons.dart';

class ImmersionDetailScreen extends StatefulWidget {
  const ImmersionDetailScreen({
    required this.event,
    super.key,
  });

  static const String routeName = "/home/details";

  final Event event;

  @override
  State<ImmersionDetailScreen> createState() => _ImmersionDetailScreenState();
}

class _ImmersionDetailScreenState extends State<ImmersionDetailScreen> {
  bool _isParticipant = false;

  @override
  void initState() {
    super.initState();
    _checkUserParticipationStatus();
  }

  Future<void> _checkUserParticipationStatus() async {
    final eventId = widget.event.id;

    try {
      final isParticipant =
          await FirebaseEventHelper().isUserParticipant(eventId);

      setState(() {
        _isParticipant = isParticipant;
      });
    } on EventException catch (e) {
      displayErrorMessage(e.message);
    } catch (error) {
      displayErrorMessage(error.toString());
    }
  }

  void joinEventSuccess() {
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

  void leaveEventSuccess() {
    Fluttertoast.showToast(
      msg: "Désinscris de l'immersion",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16,
    );
  }

  void _handleJoinEvent() {
    if (_isParticipant) {
      try {
        FirebaseEventHelper().removeParticipantFromEvent(
          widget.event.id,
          BlocProvider.of<CurrentUserCubit>(context).state.id,
        );
        leaveEventSuccess();
      } on EventException catch (e) {
        displayErrorMessage(e.message);
      } catch (error) {
        displayErrorMessage(error.toString());
      }
    } else {
      try {
        FirebaseEventHelper().addParticipantToEvent(
          widget.event.id,
          BlocProvider.of<CurrentUserCubit>(context).state.id,
        );
        joinEventSuccess();
      } on EventException catch (e) {
        displayErrorMessage(e.message);
      } catch (error) {
        displayErrorMessage(error.toString());
      }
    }

    setState(() {
      _isParticipant = !_isParticipant;
    });
  }

  void displayErrorMessage(String e) {
    showDialog<AlertDialog>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Erreur de participation'),
          content: Text('Une erreur est survenue: $e'),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        );
      },
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
                        child: Image.asset(widget.event.imageUrl),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.event.title,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 30,
                                ),
                              ),
                              Text("par ${widget.event.organizerName}"),
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
                                        widget.event.eventMonthShort
                                            .toUpperCase(),
                                        style: const TextStyle(
                                          fontSize: 14,
                                          letterSpacing: 2,
                                        ),
                                      ),
                                      Text(
                                        //"04",
                                        widget.event.eventDayNumber,
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
                                widget.event.address,
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
                                widget.event.eventTimeRange,
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
                        widget.event.description,
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
                          'assets/images/google_map_prop.png',
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
                  text: _isParticipant ? "Quitter" : "Rejoindre",
                  onPressed: () => _handleJoinEvent(),
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
