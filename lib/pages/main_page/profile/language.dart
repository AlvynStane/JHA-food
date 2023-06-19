import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing/pages/main_page/profile/profile.dart';
import 'package:testing/providers/language_provider.dart';

class Language extends StatefulWidget {
  const Language({super.key});

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  int radioValue = 0;
  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    int selectedValue = languageProvider.selectedValue;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Language',
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
        actions: [
          IconButton(
              onPressed: () {
                if (selectedValue != null) {
              languageProvider.setSelectedValue(radioValue);
              Navigator.pop(context);
            }
              },
              icon: Icon(Icons.checklist))
        ],
      ),
      body: Column(
        children: [
          RadioListTile(
              title: Text('Bahasa Indonesia'),
              value: 0,
              groupValue: radioValue,
              onChanged: (val) {
                setState(() {
                  radioValue = val!;
                });
              }),
          Divider(
            height: 15,
          ),
          RadioListTile(
              title: Text('Bahasa Inggris'),
              value: 1,
              groupValue: radioValue,
              onChanged: (val) {
                setState(() {
                  radioValue = val!;
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
