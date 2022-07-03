import 'package:ehliyetim/screens/Home/home_screen.dart';
import 'package:ehliyetim/screens/Questions/questions_screen.dart';
import 'package:flutter/material.dart';

import '../screens/Topics/topics_screen.dart';
import '../services/api_fetch.dart';

class BottomNavBarProvider extends ChangeNotifier {
  int currentIndex = 0;

  List<Widget> pages = [
    HomeScreen(),
    QuestionsScreen(),
    TopicsScreen(),
    //TopicDetailScreen(topicKey: 'ilk-yardim', index: 8), //html page
    ApiFetch(),
    //ProfilScreen(),
  ];

  Widget currentPage() {
    return pages[currentIndex];
  }

  void setCurrentIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
