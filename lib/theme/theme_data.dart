import 'package:ehliyetim/theme/colors.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData.light().copyWith(
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: MyColors.greyLightest,
    ),
    scaffoldBackgroundColor: MyColors.greyLightest,
    tabBarTheme: TabBarTheme(
      labelColor: MyColors.purple,
    ),
    appBarTheme: const AppBarTheme(iconTheme: IconThemeData(color: Colors.black)),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: MyColors.purpleLight,
      unselectedItemColor: MyColors.greyLight,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(textStyle: const TextStyle(color: Colors.white)),
    ),
    colorScheme: ColorScheme.light(
        onPrimary: MyColors.purple,
        onBackground: Colors.white,
        onSecondary: MyColors.purpleLight.withOpacity(0.1),
        onSurface: Colors.black.withOpacity(0.1),
        onPrimaryContainer: MyColors.greyLightest,
        onTertiary: MyColors.purpleLight),
    listTileTheme: ListTileThemeData(
      tileColor: Colors.white,
      selectedColor: MyColors.purpleLight,
    ));

ThemeData darkTheme = ThemeData.dark().copyWith(
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: MyColors.purple,
    ),
    scaffoldBackgroundColor: MyColors.purple,
    tabBarTheme: const TabBarTheme(
      labelColor: Colors.white,
    ),
    appBarTheme: const AppBarTheme(iconTheme: IconThemeData(color: Colors.white)),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: MyColors.purple2,
      selectedItemColor: Colors.white,
      unselectedItemColor: MyColors.purple3,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(textStyle: const TextStyle(color: Colors.white)),
    ),
    colorScheme: ColorScheme.light(
      onPrimary: Colors.white.withOpacity(0.1),
      onBackground: MyColors.purple2,
      onSecondary: Colors.white.withOpacity(0.03),
      onSurface: Colors.white.withOpacity(0.05),
      onPrimaryContainer: MyColors.purple4,
      onTertiary: Colors.white,
    ),
    listTileTheme: ListTileThemeData(
      tileColor: MyColors.purple2,
      selectedColor: MyColors.purpleLight,
    ));
