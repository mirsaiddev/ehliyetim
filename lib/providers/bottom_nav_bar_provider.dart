import 'package:ehliyetim/screens/Home/home_screen.dart';
import 'package:ehliyetim/screens/Questions/questions_screen.dart';
import 'package:flutter/material.dart';

import '../screens/Profil/profil_screen.dart';

class BottomNavBarProvider extends ChangeNotifier {
  int currentIndex = 0;

  List<Widget> pages = [
    HomeScreen(),
    QuestionsScreen(),
    Container(child: Center(child: Text('Bottom 3'))),
    ProfilScreen(),
  ];

  Widget currentPage() {
    return pages[currentIndex];
  }

  void setCurrentIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
