import 'package:ehliyetim/providers/bottom_nav_bar_provider.dart';
import 'package:ehliyetim/providers/quiz_provider.dart';
import 'package:ehliyetim/providers/splash_provider.dart';
import 'package:ehliyetim/screens/Splash/splash_screen.dart';
import 'package:ehliyetim/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';

const themeBox = 'appThemeBox';

Future<void> main() async {
  await Hive.initFlutter();
  await Hive.openBox(themeBox);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BottomNavBarProvider()),
        ChangeNotifierProvider(create: (context) => QuizProvider()),
        ChangeNotifierProvider(create: (context) => SplashProvider()),
      ],
      child: MaterialApp(
        title: 'Ehliyetim',
        theme: themeData,
        themeMode: ThemeMode.system,
        home: SplashScreen(),
      ),
    );
  }
}
