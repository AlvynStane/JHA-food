import 'package:flutter/material.dart';

class NewsProvider extends ChangeNotifier {
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  set setselectedIndex(val) {
    _selectedIndex = val;
    notifyListeners();
  }
}
