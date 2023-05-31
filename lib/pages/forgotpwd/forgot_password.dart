import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:testing/pages/forgotpwd/pwd.dart';
import 'package:testing/pages/login/login.dart';

class Forgot_Password extends StatelessWidget {
  const Forgot_Password({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.0),
          child: AppBar(
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(30))),
            centerTitle: true,
          ),
        ),
        body: Center(
            child: Container(
                width: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Change your password',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    Container(
                      height: 15,
                    ),
                    TextField(
                        keyboardType: TextInputType.text,
                        controller: TextEditingController(),
                        decoration: InputDecoration(
                          hintText: 'New Password',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(11),
                              borderSide: BorderSide(color: Colors.black)),
                        ),
                        style: TextStyle(color: Colors.black)),
                    Container(
                      height: 15,
                    ),
                    TextField(
                        keyboardType: TextInputType.text,
                        controller: TextEditingController(),
                        decoration: InputDecoration(
                          hintText: 'Confirm Password',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(11),
                              borderSide: BorderSide(color: Colors.black)),
                        ),
                        style: TextStyle(color: Colors.black)),
                    Container(
                      height: 15,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Login(
                                      title: 'Login',
                                    )));
                      },
                      child: Text('Confirm'),
                    ),
                  ],
                ))));
  }
}
