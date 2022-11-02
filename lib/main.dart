import 'dart:io';
import 'package:ehliyetim/providers/bottom_nav_bar_provider.dart';
import 'package:ehliyetim/providers/home_provider.dart';
import 'package:ehliyetim/providers/quiz_provider.dart';
import 'package:ehliyetim/providers/splash_provider.dart';
import 'package:ehliyetim/providers/statistics_provider.dart';
import 'package:ehliyetim/providers/theme_provider.dart';
import 'package:ehliyetim/screens/Splash/splash_screen.dart';
import 'package:ehliyetim/services/hive_service.dart';
import 'package:ehliyetim/theme/theme_data.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yodo1mas/testmasfluttersdktwo.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isAndroid) {
    await Firebase.initializeApp();
  }
  await HiveService().init();
  Yodo1MAS.instance.init("J2TLFjOqE1", false, (successful) {
    print('successful: $successful');
  });
  runApp(ChangeNotifierProvider<ThemeProvider>(create: (context) => ThemeProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  void showInterstitial() {
    Yodo1MAS.instance.showInterstitialAd();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BottomNavBarProvider()),
        ChangeNotifierProvider(create: (context) => QuizProvider()),
        ChangeNotifierProvider(create: (context) => SplashProvider()),
        ChangeNotifierProvider(create: (context) => StatisticsProvider()),
        ChangeNotifierProvider(create: (context) => HomeProvider()),
      ],
      child: MaterialApp(
        title: 'Ehliyetim',
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: themeProvider.getThemeMode(),
        home: const SplashScreen(),
      ),
    );
  }
}
