import 'package:ehliyetim/services/hive_service.dart';
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  ThemeProvider() {
    getThemeFromHive();
  }

  void getThemeFromHive() {
    String? theme = HiveService().getTheme();
    if (theme == null) {
      themeMode = ThemeMode.system;
      HiveService().setTheme('ThemeMode.system');
    } else if (theme == 'ThemeMode.system') {
      themeMode = ThemeMode.system;
    } else if (theme == 'ThemeMode.dark') {
      themeMode = ThemeMode.dark;
    } else if (theme == 'ThemeMode.light') {
      themeMode = ThemeMode.light;
    }
    notifyListeners();
  }

  ThemeMode? themeMode;

  getThemeMode() => themeMode;

  setThemeMode(ThemeMode _themeMode) async {
    themeMode = _themeMode;
    HiveService().setTheme('$themeMode');
    notifyListeners();
  }
}
