import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:testing/pages/login/login.dart';

class Register_News extends StatelessWidget {
  const Register_News({super.key});

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
                    Text('REGISTER',
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
                                borderSide: BorderSide(color: Colors.black)),
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.black,
                            )),
                        style: TextStyle(color: Colors.black)),
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
                                borderSide: BorderSide(color: Colors.black)),
                            prefixIcon: Icon(
                              Icons.phone,
                              color: Colors.black,
                            )),
                        style: TextStyle(color: Colors.black)),
                    Container(
                      height: 15,
                    ),
                    TextField(
                        keyboardType: TextInputType.emailAddress,
                        controller: TextEditingController(),
                        decoration: InputDecoration(
                            hintText: 'Enter Email Here',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(11),
                                borderSide: BorderSide(color: Colors.black)),
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.black,
                            )),
                        style: TextStyle(color: Colors.black)),
                    Container(
                      height: 15,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          hintText: 'Enter Password Here',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(11),
                              borderSide: BorderSide(color: Colors.black)),
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.black,
                          )),
                    ),
                    Container(
                      height: 15,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        String uEmail = TextEditingController().text.toString();
                        String uPass = TextEditingController().text;
                      },
                      child: Text('Create'),
                    ),
                    Container(
                      height: 15,
                    ),
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: 'Sudah punya akun ? Login Disini',
                          style: TextStyle(color: Colors.blue),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Login(
                                            title: 'Login',
                                          )));
                            })
                    ]))
                  ],
                ))));
  }
}
