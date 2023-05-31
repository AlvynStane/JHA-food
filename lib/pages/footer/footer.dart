import 'package:flutter/material.dart';

class Footter extends StatefulWidget {
  const Footter({super.key});

  @override
  State<Footter> createState() => _FootterState();
}

class _FootterState extends State<Footter> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_rounded),
            label: 'Profile',
          )
        ],
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        });
  }
}
