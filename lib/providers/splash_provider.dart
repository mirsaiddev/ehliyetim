import 'package:ehliyetim/screens/BottomNavBar/bottom_nav_bar.dart';
import 'package:ehliyetim/services/hive_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class SplashProvider extends ChangeNotifier {
  bool navigated = false;
  Duration duration = const Duration(seconds: 1);

  Future<void> init(context) async {
    bool subscribed = await HiveService().isSubscribed();
    if (!subscribed) {
      await FirebaseMessaging.instance.subscribeToTopic('all');
      await HiveService().setSubscribed(true);
    }
    if (!navigated) {
      navigated = true;
      await Future.delayed(duration);
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const BottomNavBar()), (route) => false);
    }
  }
}
