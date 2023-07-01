import 'package:flutter/material.dart';
import 'package:testing/pages/front_page/forget_password/change_password.dart';

class pageVerify extends StatelessWidget {
  const pageVerify({super.key});

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
                    const Text('ENTER THE VERIFICATION CODE',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    Container(
                      height: 10,
                    ),
                    const Text('Enter the 6 digit verification code',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        )),
                    Container(
                      height: 20,
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      controller: TextEditingController(),
                      decoration: InputDecoration(
                        hintText: 'Verification Code',
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
                                builder: (context) => const forgotPassword()));
                      },
                      child: const Text('Send'),
                    )
                  ],
                ))));
  }
}
