import 'package:flutter/material.dart';

import 'package:assignment/screens/calls_screen.dart';
import 'package:assignment/screens/home_screen.dart';
import 'package:assignment/screens/messages.dart';
import 'package:assignment/screens/contacts.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  final activeIconColor = const Color.fromARGB(255, 74, 73, 73);

  static final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    const CallsScreen(),
    const MessagesScreen(),
    const ContactsPage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).primaryColor,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.phone_outlined),
            label: 'Calls',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail_outline),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Contacts',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        showUnselectedLabels: true,
        unselectedItemColor: const Color.fromARGB(255, 185, 184, 184),
        selectedItemColor: activeIconColor,
      ),
    );
  }
}