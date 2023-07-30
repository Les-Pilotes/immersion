import 'package:flutter/material.dart';
import 'package:immersion/src/features/home/presentation/home_screen.dart';
import 'package:immersion/src/features/user/presentation/screen/profile_screen.dart';
import 'package:immersion/src/utils/constants.dart';

class HomeNavigationScreen extends StatefulWidget {
  const HomeNavigationScreen({super.key});

  static const String routeName = AppRoutes.routeNameHome;

  @override
  State<HomeNavigationScreen> createState() => _HomeNavigationScreenState();
}

class _HomeNavigationScreenState extends State<HomeNavigationScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    //AssistantDiscussionChatScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey.shade200,
        iconSize: 30,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: homeMenuText,
          ),
          //BottomNavigationBarItem(icon: const Icon(Icons.assistant), label: assistantMenuText,),
          BottomNavigationBarItem(
            icon: const Icon(Icons.account_circle_rounded),
            label: profileMenuText,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
