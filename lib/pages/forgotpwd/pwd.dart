import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:testing/pages/forgotpwd/forgot_password.dart';
import 'package:testing/pages/forgotpwd/verif.dart';

class Bantuan_Forgot extends StatelessWidget {
  const Bantuan_Forgot({super.key});

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
                    Text('Search your account',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    Container(
                      height: 10,
                    ),
                    Text(
                      'Enter your username or email or phone number that linked to your account',
                      textAlign: TextAlign.center,
                    ),
                    Container(
                      height: 20,
                    ),
                    TextField(
                        keyboardType: TextInputType.text,
                        controller: TextEditingController(),
                        decoration: InputDecoration(
                          hintText: 'Username, email, or phone number',
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
                                builder: (context) => const Page_Verif()));
                      },
                      child: Text('Next'),
                    )
                  ],
                ))));
  }
}
