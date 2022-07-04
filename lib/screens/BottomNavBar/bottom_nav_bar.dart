import 'package:ehliyetim/providers/bottom_nav_bar_provider.dart';
import 'package:ehliyetim/theme/colors.dart';
import 'package:ehliyetim/utils/constants/assets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BottomNavBarProvider bottomNavBarProvider = Provider.of<BottomNavBarProvider>(context);
    Color selectedItemColor = Theme.of(context).bottomNavigationBarTheme.selectedItemColor!;
    Color unselectedItemColor = Theme.of(context).bottomNavigationBarTheme.unselectedItemColor!;
    Color getColor(index) => bottomNavBarProvider.currentIndex == index ? selectedItemColor : unselectedItemColor;
    return Scaffold(
      body: bottomNavBarProvider.currentPage(),
      bottomNavigationBar: SizedBox(
        height: 70 + MediaQuery.of(context).padding.bottom,
        child: BottomNavigationBar(
          elevation: 0,
          currentIndex: bottomNavBarProvider.currentIndex,
          onTap: (val) {
            bottomNavBarProvider.setCurrentIndex(val);
          },
          landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
          type: BottomNavigationBarType.fixed,
          
          selectedFontSize: 12,
          unselectedFontSize: 12,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
          items: [
            BottomNavigationBarItem(icon: Image.asset(Assets.home, color: getColor(0), height: 24), label: 'Ana Sayfa'),
            BottomNavigationBarItem(icon: Image.asset(Assets.book, color: getColor(1), height: 24), label: 'Sorular'),
            BottomNavigationBarItem(icon: Image.asset(Assets.academic, color: getColor(2), height: 24), label: 'Ders Notları'),
            BottomNavigationBarItem(icon: Image.asset(Assets.user, color: getColor(3), height: 24), label: 'Profilim'),
          ],
        ),
      ),
    );
  }
}
