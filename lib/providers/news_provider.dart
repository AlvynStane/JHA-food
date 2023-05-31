import 'dart:convert';
import 'package:flutter/material.dart';

class NewsProvider extends ChangeNotifier {
  int _selectedIndex = 0; //variabel private
  int get selectedIndex => _selectedIndex; //ambil variabel private

  set setselectedIndex(val) {
    //mengganti private
    _selectedIndex = val;
    notifyListeners(); //merubah state secara realtime
  }
}
