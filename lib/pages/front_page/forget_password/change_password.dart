import 'package:flutter/material.dart';
import 'package:testing/pages/front_page/login/login.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

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
                    const Text('Change your password',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
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
                            borderSide: const BorderSide()),
                      ),
                    ),
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
                            borderSide: const BorderSide()),
                      ),
                    ),
                    Container(
                      height: 15,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Login()));
                      },
                      child: const Text('Confirm'),
                    ),
                  ],
                ))));
  }
}
