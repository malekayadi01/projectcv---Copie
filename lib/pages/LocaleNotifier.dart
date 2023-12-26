import 'package:flutter/material.dart';

class LocaleNotifier extends ChangeNotifier {
  Locale _currentLocale = const Locale('en'); // Default to English

  Locale get currentLocale => _currentLocale;

  void updateLocale(Locale newLocale) {
    _currentLocale = newLocale;
    notifyListeners();
  }
}
