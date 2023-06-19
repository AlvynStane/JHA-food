import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:testing/pages/main_page/profile/profile.dart';

class balance extends StatefulWidget {
  const balance({super.key});

  @override
  State<balance> createState() => _balanceState();
}

class _balanceState extends State<balance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: const Text(
        'Your Balance',
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
