import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing/pages/forgotpwd/pwd.dart';
import 'package:testing/menu.dart';
import 'package:testing/pages/regist/regist_news.dart';
import 'package:testing/main.dart';

import '../../providers/dark_theme.dart';

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
          title: Text(widget.title),
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
          backgroundColor: Colors.purple,
        ),
        body: Center(
            child: SizedBox(
                width: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('LOGIN',
                        style: TextStyle(color: Colors.black, fontSize: 35)),
                    TextField(
                        keyboardType: TextInputType.emailAddress,
                        controller: TextEditingController(),
                        decoration: InputDecoration(
                            hintText: 'Enter Email Here',
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(11),
                                borderSide:
                                    const BorderSide(color: Colors.black, width: 2)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(11),
                                borderSide: const BorderSide(
                                    color: Colors.blueAccent, width: 2)),
                            disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(11),
                                borderSide: const BorderSide(
                                    color: Colors.black45, width: 2)),
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
                                borderSide: const BorderSide(color: Colors.black)),
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
                                'Login',
                              ))),
                    ),
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: 'Belum punya akun ? Daftar Disini',
                          style: const TextStyle(color: Colors.blue),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const Register_News()));
                            })
                    ])),
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: 'Lupa Password ?',
                          style: const TextStyle(color: Colors.blue),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const bantuanForgot()));
                            })
                    ])),
                  ],
                ))));
  }
}
