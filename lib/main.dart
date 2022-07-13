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

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await HiveService().init();
  runApp(ChangeNotifierProvider<ThemeProvider>(create: (context) => ThemeProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: themeProvider.getThemeMode(),
        home: const SplashScreen(),
      ),
    );
  }
}
