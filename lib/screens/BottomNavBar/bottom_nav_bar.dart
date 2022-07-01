import 'package:ehliyetim/providers/bottom_nav_bar_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BottomNavBarProvider bottomNavBarProvider =
        Provider.of<BottomNavBarProvider>(context);
    return Scaffold(
      body: bottomNavBarProvider.currentPage(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: bottomNavBarProvider.currentIndex,
        onTap: (val) {
          bottomNavBarProvider.setCurrentIndex(val);
        },
        landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.indigo,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Ana Sayfa'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Testler'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Konu Anlatımları'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Profilim'),
        ],
      ),
    );
  }
}
