import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier{
  List<String> languageList = ['Indonesia', 'English'];
  String _selectedLanguage = 'Indonesia';

  String get selectedLanguage => _selectedLanguage;

  void changeLanguage(String value) {
    _selectedLanguage = value;
    notifyListeners();
  }
}
