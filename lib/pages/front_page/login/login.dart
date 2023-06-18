import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing/pages/front_page/forget_password/forget_password.dart';
import 'package:testing/pages/main_page/main_menu_page.dart';
import 'package:testing/pages/front_page/register/register_news.dart';
import 'package:testing/providers/dark_theme.dart';

class Login extends StatefulWidget {
  const Login({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<Login> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Login> {
  bool _agree = false;
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('SIGN IN'),
          actions: <Widget>[
            Icon(themeProvider.darkTheme == false
                ? Icons.wb_sunny
                : Icons.nightlight_round),
            Switch(
                value: themeProvider.darkTheme,
                onChanged: (value) {
                  setState(() {
                    themeProvider.darkMode = value;
                  });
                })
          ],
          centerTitle: true,
        ),
        body: Center(
            child: SizedBox(
                width: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('SIGN IN', style: TextStyle(fontSize: 35)),
                    TextField(
                        controller: TextEditingController(),
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: 'Enter Email Here',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(11),
                                borderSide:
                                    const BorderSide(color: Colors.black)),
                            prefixIcon: const Icon(
                              Icons.email,
                              color: Colors.black,
                            )),
                        style: const TextStyle(color: Colors.black)),
                    Container(
                      height: 11,
                    ),
                    TextField(
                        controller: TextEditingController(),
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: 'Enter Password Here',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(11),
                                borderSide:
                                    const BorderSide(color: Colors.black)),
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: Colors.black,
                            )),
                        style: const TextStyle(color: Colors.black)),
                    Row(
                      children: <Widget>[
                        Checkbox(
                          value: _agree,
                          onChanged: (bool? val) {
                            setState(() {
                              _agree = val!;
                            });
                          },
                        ),
                        const Text("I'm not a robot"),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      padding: const EdgeInsets.all(15),
                      child: SizedBox(
                          height: 40,
                          width: 90,
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Menu()));
                              },
                              child: const Text(
                                'SIGN IN',
                              ))),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Not registered? "),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const Register_News()));
                            },
                            style: ButtonStyle(
                                overlayColor: MaterialStateProperty.all<Color>(
                                    Colors.transparent)),
                            child: const Text(
                              'Create an account',
                              style: TextStyle(color: Colors.blue),
                            )),
                      ],
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const bantuanForgot()));
                        },
                        style: ButtonStyle(
                            overlayColor: MaterialStateProperty.all<Color>(
                                Colors.transparent)),
                        child: const Text(
                          'Forgot password?',
                          style: TextStyle(color: Colors.blue),
                        )),
                  ],
                ))));
  }
}
