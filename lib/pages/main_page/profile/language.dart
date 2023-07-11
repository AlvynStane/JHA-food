import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing/providers/language_provider.dart';

class Language extends StatefulWidget {
  const Language({Key? key}) : super(key: key);

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  late String radioValue;

  @override
  void initState() {
    super.initState();
    final languageProvider = Provider.of<LanguageProvider>(context, listen: false);
    radioValue = languageProvider.selectedLanguage;
  }

  @override
  Widget build(BuildContext context) {
      final languageProvider = Provider.of<LanguageProvider>(context);
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
              languageProvider.changeLanguage(radioValue);
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.check,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: languageProvider.languageList.length,
          itemBuilder: (context, index) {
            return Container(
              decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey))),
              child: RadioListTile(
                title: Text(languageProvider.languageList[index]),
                value: languageProvider.languageList[index],
                groupValue: radioValue,
                onChanged: (val) {
                  setState(() {
                    radioValue = val as String;
                  });
                },
              ),
            );
          },
        ),
      ),
    );
  }
}