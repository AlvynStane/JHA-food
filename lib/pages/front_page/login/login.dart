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
  bool _obscureText = true;
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
        ),
        body: Center(
            child: SizedBox(
                width: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('LOGIN',
                        style: TextStyle(fontSize: 35)),
                    TextField(
                        keyboardType: TextInputType.emailAddress,
                        controller: TextEditingController(),
                        decoration: InputDecoration(
                            hintText: 'Enter Email Here',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(11),
                                borderSide: const BorderSide(width: 2)),
                            prefixIcon: const Icon(Icons.email)),
                        ),
                    Container(
                      height: 11,
                    ),
                    TextField(
                        controller: TextEditingController(),
                        obscureText: _obscureText,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            hintText: 'Enter Password Here',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(11),
                            ),
                            prefixIcon: const Icon(Icons.lock),
                            suffixIcon: InkWell(
                              onTap: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              }, 
                              child: Icon(_obscureText ? Icons.visibility : Icons.visibility_off))),
                        ),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Belum punya akun ? '),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const Register_News()));
                          }, 
                          style: ButtonStyle(overlayColor: MaterialStateProperty.all<Color>(Colors.transparent)),
                          child: const Text('Daftar Disini', style: TextStyle(color: Colors.blue),)
                        ),
                      ],
                    ),
                    TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const bantuanForgot()));
                          }, 
                          style: ButtonStyle(overlayColor: MaterialStateProperty.all<Color>(Colors.transparent)),
                          child: const Text('Lupa Password ?', style: TextStyle(color: Colors.blue),)
                        ),
                  ],
                ))));
  }
}
