import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  int _selectedValue = 1;

  int get selectedValue => _selectedValue;

  void setSelectedValue(int value) {
    _selectedValue = value;
    notifyListeners();
  }
}