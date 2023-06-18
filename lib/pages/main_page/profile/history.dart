import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:testing/pages/main_page/profile/profile.dart';

class history extends StatefulWidget {
  const history({super.key});

  @override
  State<history> createState() => _historyState();
}

class _historyState extends State<history> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'History',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Profile()));
          },
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.white,
        ),
      ),
    );
  }
}
