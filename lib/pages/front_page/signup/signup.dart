import 'package:flutter/material.dart';
import 'package:testing/pages/front_page/login/login.dart';
import 'package:testing/pages/main_page/main_menu_page.dart';

class Register_News extends StatefulWidget {
  Register_News({super.key});

  @override
  State<Register_News> createState() => _Register_NewsState();
}

class _Register_NewsState extends State<Register_News> {
  final _unameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
            child: SizedBox(
                width: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('SIGN UP',
                        style: TextStyle(color: Colors.black, fontSize: 35)),
                    Container(
                      height: 30,
                    ),
                    TextField(
                        keyboardType: TextInputType.name,
                        controller: TextEditingController(),
                        decoration: InputDecoration(
                            hintText: 'Enter Username Here',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(11),
                                borderSide:
                                    const BorderSide(color: Colors.black)),
                            prefixIcon: const Icon(
                              Icons.person,
                              color: Colors.black,
                            )),
                        style: const TextStyle(color: Colors.black)),
                    Container(
                      height: 15,
                    ),
                    TextField(
                        keyboardType: TextInputType.number,
                        controller: TextEditingController(),
                        decoration: InputDecoration(
                            hintText: 'Enter Phone Number Here',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(11),
                                borderSide:
                                    const BorderSide(color: Colors.black)),
                            prefixIcon: const Icon(
                              Icons.phone,
                              color: Colors.black,
                            )),
                        style: const TextStyle(color: Colors.black)),
                    Container(
                      height: 15,
                    ),
                    TextField(
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
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
                      height: 15,
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
                    Container(
                      height: 15,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePages()));
                      },
                      child: const Text('Create'),
                    ),
                    Container(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already have an account? "),
                        TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Login()));
                            },
                            style: ButtonStyle(
                                overlayColor: MaterialStateProperty.all<Color>(
                                    Colors.transparent)),
                            child: const Text(
                              'Sign in here',
                              style: TextStyle(color: Colors.blue),
                            )),
                      ],
                    ),
                  ],
                ))));
  }
}
