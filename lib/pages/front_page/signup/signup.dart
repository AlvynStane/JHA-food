import 'package:flutter/material.dart';
import 'package:testing/pages/front_page/login/login.dart';
import 'package:testing/pages/main_page/main_menu_page.dart';
import 'package:testing/providers/saved_account.dart';

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
  late bool create;
  final _formKey = GlobalKey<FormState>();

  void showErrorSnackBar(String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
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
                  const Text('SIGN UP', style: TextStyle(fontSize: 35)),
                  SizedBox(height: 30),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter email/username';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.name,
                    controller: _unameController,
                    decoration: InputDecoration(
                        hintText: 'Enter Username Here',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11),
                            borderSide: const BorderSide()),
                        prefixIcon: const Icon(
                          Icons.person,
                        )),
                  ),
                  Container(
                    height: 15,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter email/username';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    controller: _phoneController,
                    decoration: InputDecoration(
                        hintText: 'Enter Phone Number Here',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11),
                            borderSide: const BorderSide()),
                        prefixIcon: const Icon(
                          Icons.phone,
                        )),
                  ),
                  Container(
                    height: 15,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter email/username';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                    decoration: InputDecoration(
                        hintText: 'Enter Email Here',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11),
                            borderSide: const BorderSide()),
                        prefixIcon: const Icon(
                          Icons.email,
                        )),
                  ),
                  Container(
                    height: 15,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter email/username';
                      }
                      return null;
                    },
                    controller: _passwordController,
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
                        color: Colors.transparent,
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      ),
                    ),
                    style: const TextStyle(),
                  ),
                  Container(
                    height: 15,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        create = createNewAcc(
                            _unameController.text,
                            _passwordController.text,
                            _emailController.text,
                            _phoneController.text,
                            0,
                            showErrorSnackBar);
                        if (create) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePages()));
                        }
                      }
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
              )),
        )));
  }
}
