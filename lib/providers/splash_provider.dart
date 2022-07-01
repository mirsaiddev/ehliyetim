import 'package:ehliyetim/screens/BottomNavBar/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class SplashProvider extends ChangeNotifier {
  bool navigated = false;
  Duration duration = const Duration(seconds: 1);

  Future<void> init(context) async {
    if (!navigated) {
      navigated = true;
      await Future.delayed(duration);
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => BottomNavBar()), (route) => false);
    }
  }
}
