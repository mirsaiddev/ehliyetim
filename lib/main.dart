import 'package:ehliyetim/providers/bottom_nav_bar_provider.dart';
import 'package:ehliyetim/providers/quiz_provider.dart';
import 'package:ehliyetim/providers/splash_provider.dart';
import 'package:ehliyetim/screens/Splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';

const themeBox = 'appThemeBox';

Future<void> main() async {
  await Hive.initFlutter();
  await Hive.openBox(themeBox);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.dark);
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BottomNavBarProvider()),
        ChangeNotifierProvider(create: (context) => QuizProvider()),
        ChangeNotifierProvider(create: (context) => SplashProvider()),
      ],
      child: ValueListenableBuilder<ThemeMode>(
        valueListenable: themeNotifier,
        builder: (_, ThemeMode currentMode, __) {
          return MaterialApp(
            title: 'Ehliyetim',
            theme: ThemeData(primarySwatch: Colors.purple),
            darkTheme: ThemeData(
                primaryColor: Colors.black,
                primaryColorLight: Colors.black,
                brightness: Brightness.dark,
                primaryColorDark: Colors.black,
                indicatorColor: Colors.white,
                canvasColor: Colors.black,
                textTheme: TextTheme(),

                // next line is important!
                appBarTheme: AppBarTheme(systemOverlayStyle: SystemUiOverlayStyle.light)),
            themeMode: currentMode,
            home: SplashScreen(),
          );
        },
      ),
    );
  }
}
