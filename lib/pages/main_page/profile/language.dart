import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:testing/pages/main_page/profile/profile.dart';

class Language extends StatefulWidget {
  const Language({super.key});

  @override
  State<Language> createState() => _LanguageState();
}

int _radioValue = 1;

class _LanguageState extends State<Language> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Language',
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
      body: Column(
        children: [
          RadioListTile(
              title: Text('Bahasa Indonesia'),
              value: 0,
              groupValue: _radioValue,
              onChanged: (val) {
                setState(() {
                  _radioValue = 0;
                });
              }),
          Divider(
            height: 15,
          ),
          RadioListTile(
              title: Text('Bahasa Inggris'),
              value: 1,
              groupValue: _radioValue,
              onChanged: (val) {
                setState(() {
                  _radioValue = 1;
                });
              }),
          Divider(
            height: 15,
          ),
        ],
      ),
    );
  }
}
