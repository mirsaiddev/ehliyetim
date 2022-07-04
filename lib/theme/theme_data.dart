import 'package:ehliyetim/theme/colors.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData.light().copyWith(
  scaffoldBackgroundColor: MyColors.greyLightest,
  tabBarTheme: TabBarTheme(
    labelColor: MyColors.purple,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    selectedItemColor: MyColors.purpleLight,
    unselectedItemColor: MyColors.greyLight,
  ),
  colorScheme: ColorScheme.light(
    onPrimary: MyColors.purple,
    onBackground: Colors.white,
    onSecondary: MyColors.purpleLight.withOpacity(0.1),
    onSurface: Colors.black.withOpacity(0.1),
  ),
);

ThemeData darkTheme = ThemeData.dark().copyWith(
  scaffoldBackgroundColor: MyColors.purple,
  tabBarTheme: TabBarTheme(
    labelColor: Colors.white,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: MyColors.purple2,
    selectedItemColor: Colors.white,
    unselectedItemColor: MyColors.purple3,
  ),
  colorScheme: ColorScheme.light(
    onPrimary: Colors.white.withOpacity(0.1),
    onBackground: MyColors.purple2,
    onSecondary: Colors.white.withOpacity(0.05),
    onSurface: Colors.white.withOpacity(0.05),
  ),
);
