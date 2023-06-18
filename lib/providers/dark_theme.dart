import 'package:flutter/material.dart';

class DarkThemeProvider with ChangeNotifier {
  var light =
      ThemeData(brightness: Brightness.light, primarySwatch: Colors.cyan);

  var dark = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.grey,
  );

  bool _darkTheme = false;
  bool get darkTheme => _darkTheme;

  set darkMode(bool value) {
    _darkTheme = value;
    notifyListeners();
  }
}
