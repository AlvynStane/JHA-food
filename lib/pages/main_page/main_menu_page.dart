import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing/pages/main_page/menu/menu.dart';
import 'package:testing/pages/main_page/profile/profile.dart';
import 'package:testing/pages/main_page/menu/cart_page.dart';
import 'package:testing/providers/dark_theme.dart';

void main() => runApp(const Menu());

class Menu extends StatelessWidget {
  const Menu({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<DarkThemeProvider>(context);
    return MaterialApp(
      title: "JHA FOOD",
      home: MyHomePage(),
      theme: themeProvider.darkTheme == true ? themeProvider.dark : themeProvider.light,
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  final List _widgetOptions = [
    const MainMenu(),
    const Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF21BFBD),
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
            Navigator.push(
                context, MaterialPageRoute(builder: ((context) => const CartPage())));
          },
          child: const Icon(Icons.shopping_basket),
        ),
      ),
    );
  }
}