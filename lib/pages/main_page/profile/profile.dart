import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing/pages/front_page/login/login.dart';
import 'package:testing/pages/main_page/profile/address.dart';
import 'package:testing/pages/main_page/profile/balance.dart';
import 'package:testing/pages/main_page/profile/contact.dart';
import 'package:testing/pages/main_page/profile/history.dart';
import 'package:testing/pages/main_page/profile/language.dart';
import 'package:testing/pages/main_page/profile/faq.dart';
import 'package:testing/providers/dark_theme.dart';
import 'package:testing/providers/saved_account.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key});

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
  late String username;
  late String email;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final accountProvider = Provider.of<AccountProvider>(context, listen: false);
    if (accountProvider.loggedInAccount == null){ accountProvider.login(accountProvider.accountList[0]);}
    final themeProvider = Provider.of<DarkThemeProvider>(context);
    String username = accountProvider.loggedInAccount!.username;
    String email = accountProvider.loggedInAccount!.email;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Profile',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ListTile(
              leading: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.white10,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: const CircleAvatar(
                      radius: 70,
                      backgroundImage: AssetImage('assets/selena.jpg'),
                    ),
                  ),
              title: Text(
                username,
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                email,
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                ),
              ),
              trailing: IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  _editProfile();
                },
              ),
            ),
            SizedBox(height: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Account',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      _listItem(Icons.credit_card, 'Balance',
                          page: SaldoPage()),
                      _listItem(Icons.location_city_rounded, 'Saved Address',
                          page: Address()),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Activities',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      _listItem(Icons.history, 'Order History',
                          page: History()),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'General',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      _listItem(Icons.language, 'Language', page: Language()),
                      _listItem(
                          themeProvider.darkTheme == false
                              ? Icons.wb_sunny
                              : Icons.nightlight_round,
                          'Dark Theme'),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Help Center',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      _listItem(Icons.question_answer, 'FAQ', page: Help()),
                      SizedBox(height: 10),
                      _listItem(Icons.help_center, 'Contact Us',
                          page: Contact()),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(8.0),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  accountProvider.logout();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Login(),
                    ),
                  );
                },
                child: const Text('LOG OUT'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _listItem(IconData icon, String name, {Widget? page}) {
    final themeProvider = Provider.of<DarkThemeProvider>(context);
    return InkWell(
      onTap: () {
        if (page != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        }
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.grey),
          ),
        ),
        child: ListTile(
          title: Text(name),
          leading: Icon(icon),
          trailing: page != null
              ? Icon(Icons.arrow_forward_ios)
              : Switch(
                  value: themeProvider.darkTheme,
                  onChanged: (value) {
                    setState(() {
                      themeProvider.darkMode = value;
                    });
                  },
                ),
        ),
      ),
    );
  }

  void _editProfile() {
    showDialog(
      context: context,
      builder: (context) {
        final accountProvider = Provider.of<AccountProvider>(context, listen: false);
        String newUsername = accountProvider.loggedInAccount!.username;
        String newEmail = accountProvider.loggedInAccount!.email;
        String newPhone = accountProvider.loggedInAccount!.phonenum;
        String newPass = accountProvider.loggedInAccount!.password;
        return AlertDialog(
          title: Text('Edit Profile'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                onChanged: (value) {
                  newUsername = value;
                },
                decoration: InputDecoration(
                  labelText: 'Username',
                ),
              ),
              TextField(
                onChanged: (value) {
                  newEmail = value;
                },
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
              ),
              TextField(
                onChanged: (value) {
                  newPhone = value;
                },
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                ),
              ),
              TextField(
                onChanged: (value) {
                  newPass = value;
                },
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  accountProvider.editProfile(newUsername, newEmail, newPass, newPhone);
                });
                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}
