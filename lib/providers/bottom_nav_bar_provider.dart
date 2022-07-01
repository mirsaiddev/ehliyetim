import 'package:ehliyetim/screens/Questions/questions_screen.dart';
import 'package:flutter/material.dart';

class BottomNavBarProvider extends ChangeNotifier {
  int currentIndex = 0;

  List<Widget> pages = [
    Container(child: Center(child: Text('Bottom 1'))),
    QuestionsScreen(),
    Container(child: Center(child: Text('Bottom 3'))),
    Container(child: Center(child: Text('Bottom 4'))),
  ];

  Widget currentPage() {
    return pages[currentIndex];
  }

  void setCurrentIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
