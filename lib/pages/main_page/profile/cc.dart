import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:testing/pages/main_page/profile/profile.dart';

class cc extends StatefulWidget {
  const cc({super.key});

  @override
  State<cc> createState() => _ccState();
}

class _ccState extends State<cc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: const Text(
        'Credit Card',
        style: TextStyle(color: Colors.white),
      ),
      centerTitle: true,
      leading: IconButton(
        onPressed: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const Profile()));
        },
        icon: const Icon(Icons.arrow_back_ios),
        color: Colors.white,
      ),
    ));
  }
}
