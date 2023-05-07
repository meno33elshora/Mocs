import 'package:flutter/material.dart';

import 'theme_cache.dart';

class ThemeController with ChangeNotifier {
  late bool _isDark;
  late MyThemePreferences _preferences;

  bool get isDark => _isDark;

  ThemeController() {
    _isDark = false;
    _preferences = MyThemePreferences();
    getPreferences();
  }

//Switching the themes
  set isDark(bool value) {
    _isDark = value;
    _preferences.setTheme(value);
    notifyListeners();
  }

  getPreferences() async {
    _isDark = await _preferences.getTheme();
    notifyListeners();
  }
}
