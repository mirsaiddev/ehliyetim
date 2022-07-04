import 'package:ehliyetim/main.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ThemeProvider with ChangeNotifier {
  ThemeProvider() {
    getThemeFromHive();
  }

  void getThemeFromHive() {
    String? theme = Hive.box(themeBox).get('theme');
    print('theme is $theme');
    if (theme == null || theme == 'ThemeMode.system') {
      themeMode = ThemeMode.system;
      Hive.box(themeBox).put('theme', 'system');
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
    Hive.box(themeBox).put('theme', _themeMode.toString());
    notifyListeners();
  }
}
