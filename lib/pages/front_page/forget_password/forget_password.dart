import 'package:flutter/material.dart';
import 'package:testing/pages/front_page/forget_password/verify_code.dart';

class BantuanForgot extends StatelessWidget {
  const BantuanForgot({super.key});

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
                    const Text('Search your account',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    Container(
                      height: 10,
                    ),
                    const Text(
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
                                builder: (context) => const PageVerify()));
                      },
                      child: const Text('Next'),
                    )
                  ],
                ))));
  }
}
