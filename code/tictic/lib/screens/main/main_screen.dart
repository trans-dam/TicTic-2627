import 'package:flutter/material.dart';
import 'package:tictic/screens/main/settings/settings.dart';

import 'home/home.dart';

class MainScreen extends StatefulWidget {
  MainScreen({super.key});

  static String routeName = '/main';

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> bodies = [Home(), Settings()];

  int _currentBodyIDX = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bodies[_currentBodyIDX],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (idx) {
          setState(() {
            _currentBodyIDX = idx;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'settings',
          ),
        ],
      ),
    );
  }
}
