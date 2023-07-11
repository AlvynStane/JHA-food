import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing/pages/front_page/forget_password/forget_password.dart';
import 'package:testing/pages/main_page/main_menu_page.dart';
import 'package:testing/pages/front_page/signup/signup.dart';
import 'package:testing/pages/front_page/login/recapcha.dart';
import 'package:testing/providers/saved_account.dart';

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
  late LoginResult logged;
  String? _agreeError;

  void showErrorSnackBar(String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final accountProvider =
        Provider.of<AccountProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Form(
          key: _formKey,
          child: SizedBox(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('SIGN IN', style: TextStyle(fontSize: 35)),
                const SizedBox(height: 30),
                TextFormField(
                  controller: _emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter email/username';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter Email Here',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11),
                      borderSide: const BorderSide(),
                    ),
                    prefixIcon: const Icon(
                      Icons.email,
                    ),
                  ),
                ),
                Container(
                  height: 11,
                ),
                TextFormField(
                  controller: _passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter password';
                    }
                    return null;
                  },
                  obscureText: _obscureText,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'Enter Password Here',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11),
                      borderSide: const BorderSide(),
                    ),
                    prefixIcon: const Icon(
                      Icons.lock,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Checkbox(
                      value: _agree,
                      onChanged: (bool? val) {
                        setState(() {
                          _agree = val!;
                          _agreeError = null;
                        });
                      },
                    ),
                    const Text(
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
                        style: const TextStyle(color: Colors.red),
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
                            logged = accountProvider.checkLoginCredentials(
                                _emailController.text,
                                _passwordController.text,
                                showErrorSnackBar);
                            if (logged.success) {
                              accountProvider.login(logged.account!);
                              showDialog(
                                context: context,
                                builder: (context) => const MyDialog(),
                              ).then((isCorrect){
                              Timer(const Duration(milliseconds: 50), (){Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomePages(),
                                ),
                              );});
                              });
                            }
                          }
                        }
                      },
                      child: const Text('SIGN IN'),
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
                            builder: (context) => const Register(),
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
                        builder: (context) => const BantuanForgot(),
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
