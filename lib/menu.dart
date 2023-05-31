import 'package:flutter/material.dart';
import 'package:testing/pages/menu/mainmenu.dart';
import 'package:testing/pages/profile/profile.dart';
import 'package:testing/pages/menu/cartPage.dart';

void main() => runApp(const Menu());

class Menu extends StatelessWidget {
  const Menu({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "JHA FOOD",
      home: MyHomePage(),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: ((context) => const CartPage())));
        },
        child: const Icon(Icons.shopping_basket),
      ),
    );
  }

  // Widget _buildFoodItem(String imgPath, String foodName, double price,
  //     String weight, String cal, String vit, String pro) {
  //   return Padding(
  //     padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
  //     child: InkWell(
  //         onTap: () {
  //           Navigator.of(context).push(MaterialPageRoute(
  //               builder: (context) => DetailsPage(
  //                     heroTag: imgPath,
  //                     foodName: foodName,
  //                     foodPrice: price,
  //                     weight: weight,
  //                     cal: cal,
  //                     vit: vit,
  //                     pro: pro,
  //                   )));
  //         },
  //         child: Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: <Widget>[
  //             Container(
  //                 child: Row(children: [
  //               Hero(
  //                   tag: imgPath,
  //                   child: Image(
  //                       image: AssetImage(imgPath),
  //                       fit: BoxFit.cover,
  //                       height: 75.0,
  //                       width: 75.0)),
  //               SizedBox(width: 10.0),
  //               Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
  //                 Text(foodName,
  //                     style: TextStyle(
  //                         fontFamily: 'Montserrat',
  //                         fontSize: 17.0,
  //                         fontWeight: FontWeight.bold)),
  //                 Text('\$$price',
  //                     style: TextStyle(
  //                         fontFamily: 'Montserrat',
  //                         fontSize: 15.0,
  //                         color: Colors.grey))
  //               ])
  //             ])),
  //             Icon(
  //               Icons.search,
  //               color: Colors.black,
  //             )
  //           ],
  //         )),
  //   );
  // }
}
