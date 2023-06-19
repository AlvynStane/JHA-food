import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:testing/pages/main_page/profile/profile.dart';

class questions extends StatefulWidget {
  const questions({super.key});

  @override
  State<questions> createState() => _questionsState();
}

class _questionsState extends State<questions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: const Text(
        'Help',
        style: TextStyle(color: Colors.white),
      ),
      centerTitle: true,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back_ios),
        color: Colors.white,
      ),
    ));
  }
}
