import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing/pages/front_page/forget_password/forget_password.dart';
import 'package:testing/pages/main_page/main_menu_page.dart';
import 'package:testing/pages/front_page/signup/signup.dart';
import 'package:testing/providers/dark_theme.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _agree = false;
  bool _obscureText = true;
  String? _agreeError;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
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
            },
          ),
        ],
        centerTitle: true,
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: SizedBox(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('LOG IN', style: TextStyle(fontSize: 35)),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: 'Enter Email Here',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                    prefixIcon: const Icon(
                      Icons.email,
                      color: Colors.black,
                    ),
                  ),
                  style: const TextStyle(color: Colors.black),
                ),
                Container(
                  height: 11,
                ),
                TextFormField(
                  controller: _passwordController,
                  obscureText: _obscureText,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'Enter Password Here',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: Colors.black,
                    ),
                    suffixIcon: IconButton(
                      color: Colors.transparent,
                      icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    ),
                  ),
                  style: const TextStyle(color: Colors.black),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Checkbox(
                      value: _agree,
                      onChanged: (bool? val) {
                        setState(() {
                          _agree = val!;
                          _agreeError =
                              null; // Reset _agreeError when checkbox value changes
                        });
                      },
                    ),
                    Text(
                      "I'm not a robot",
                    ),
                  ],
                ),
                if (_agreeError != null)
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 28.0),
                      child: Text(
                        _agreeError!,
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.all(15),
                  child: SizedBox(
                    height: 40,
                    width: 90,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          if (!_agree) {
                            setState(() {
                              _agreeError = "Please show you're not a robot";
                            });
                          } else {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomePages(),
                              ),
                            );
                          }
                        }
                      },
                      child: const Text('LOG IN'),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Not registered? "),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Register_News(),
                          ),
                        );
                      },
                      style: ButtonStyle(
                        overlayColor: MaterialStateProperty.all<Color>(
                            Colors.transparent),
                      ),
                      child: const Text(
                        'Create an account',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const bantuanForgot(),
                      ),
                    );
                  },
                  style: ButtonStyle(
                    overlayColor:
                        MaterialStateProperty.all<Color>(Colors.transparent),
                  ),
                  child: const Text(
                    'Forgot password?',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
