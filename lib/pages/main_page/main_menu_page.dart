import 'package:flutter/material.dart';
import 'package:testing/pages/main_page/menu/menu.dart';
import 'package:testing/pages/main_page/profile/profile.dart';
import 'package:testing/pages/main_page/menu/cart_page.dart';

class HomePages extends StatefulWidget {
  const HomePages({super.key});

  @override
  _HomePagesState createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  int _selectedIndex = 0;
  final List _widgetOptions = [
    const MainMenu(),
    const Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xFF21BFBD),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_2_rounded),
              label: 'Profile',
            )
          ],
          currentIndex: _selectedIndex,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          }),
      floatingActionButton: Visibility(
        visible: _selectedIndex == 0,
        child: FloatingActionButton(
          tooltip: "List",
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: ((context) => const CartPage())));
          },
          child: const Icon(Icons.shopping_basket),
        ),
      ),
    );
  }
}
