import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing/providers/dark_theme.dart';
import 'package:testing/providers/saved_account.dart';
import 'details_page.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  @override
  Widget build(BuildContext context) {
    final accountProvider = Provider.of<AccountProvider>(context, listen: false);
    if (accountProvider.loggedInAccount == null) {
      accountProvider.login(accountProvider.accountList[0]);
    }
    return Scaffold(
      backgroundColor: context.watch<DarkThemeProvider>().darkTheme ? Colors.grey[800] : Colors.cyan,
      body: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(top: 15.0, left: 10.0),
            child: Text('Welcome, Order Now!',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0),),
          ),
          const SizedBox(height: 25.0),
          Padding(
            padding: const EdgeInsets.only(left: 120.0),
            child: Row(
              children: const <Widget>[
                Text('Healthy',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                      ),
                    ),
                SizedBox(width: 10.0),
                Text('Food Menu',
                    style: TextStyle(fontSize: 25.0),
                )
              ],
            ),
          ),
          const SizedBox(height: 25.0),
          Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: context.watch<DarkThemeProvider>().darkTheme ? Colors.grey[850] : Colors.white,
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(75.0)),
            ),
            child: ListView(
              primary: false,
              padding: const EdgeInsets.only(left: 25.0, right: 20.0),
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.only(top: 45.0),
                    child: SizedBox(
                        height: MediaQuery.of(context).size.height - 260.0,
                        child: ListView(children: [
                          _buildFoodItem('plate1.png', 'Salmon bowl', 24.00),
                          _buildFoodItem('plate2.png', 'Spring bowl', 22.00),
                          _buildFoodItem('plate3.png', 'Salmon Salad', 24.00),
                          _buildFoodItem(
                              'plate4.png', 'Curry Rice bowl', 25.00),
                          _buildFoodItem('plate5.png', 'Berry bowl', 30.00),
                          _buildFoodItem('plate6.png', 'Avocado bowl', 45.00),
                          _buildFoodItem(
                              'plate7.png', 'Lamb with potato', 35.00),
                          _buildFoodItem(
                              'plate8.png', 'Steak with fries', 50.00),
                          _buildFoodItem('plate9.png', 'Grilled Rabbit', 30.00),
                          _buildFoodItem(
                              'plate10.png', 'Fried duck meat', 28.00),
                          _buildFoodItem(
                              'plate11.png', 'Rice with vege.', 32.00),
                          _buildFoodItem('plate12.png', 'Tinga Chicken', 25.00),
                          _buildFoodItem(
                              'plate13.png', 'Roasted Chicken', 30.00),
                          _buildFoodItem('plate14.png', 'Shrimp Creole', 19.00),
                          _buildFoodItem(
                              'plate15.png', 'Chicken Quinoa', 26.00),
                          _buildFoodItem('plate16.png', 'BBQ Salmon', 27.00),
                          _buildFoodItem('plate17.png', 'Beef w/ chili', 39.00),
                        ]))),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFoodItem(
    String imgPath,
    String foodName,
    double price,
  ) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
      child: InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => DetailsPage(
                      heroTag: imgPath,
                      foodName: foodName,
                      foodPrice: price,
                    )));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(children: [
                Hero(
                    tag: imgPath,
                    child: Image(
                        image: AssetImage(imgPath),
                        fit: BoxFit.cover,
                        height: 75.0,
                        width: 75.0)),
                const SizedBox(width: 10.0),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(foodName,
                      style: const TextStyle(
                          fontSize: 17.0, fontWeight: FontWeight.bold)),
                  Text('\$$price',
                      style: const TextStyle(
                        fontSize: 15.0,
                      ))
                ])
              ]),
            ],
          )),
    );
  }
}
