import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  ThemeMode get currentTheme => _isDarkMode ? ThemeMode.dark : ThemeMode.light;

  ThemeData getTheme() {
    return _isDarkMode ? darkTheme : lightTheme;
  }

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}

final ThemeData lightTheme = ThemeData(
  primarySwatch: Colors.blue,
  visualDensity: VisualDensity.adaptivePlatformDensity,
);

final ThemeData darkTheme = ThemeData(
  primarySwatch: Colors.indigo,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  brightness: Brightness.dark,
);