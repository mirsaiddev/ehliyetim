import 'package:ehliyetim/providers/bottom_nav_bar_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/constants/assets.dart';

class StartButton extends StatelessWidget {
  const StartButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BottomNavBarProvider bottomNavBarProvider = Provider.of<BottomNavBarProvider>(context, listen: false);

    return GestureDetector(
      onTap: () {
        bottomNavBarProvider.setCurrentIndex(1);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Theme.of(context).colorScheme.onPrimary,
          image: const DecorationImage(
            image: AssetImage(Assets.pattern4),
            fit: BoxFit.cover,
          ),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        height: 78,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 14),
              Image.asset(Assets.brain, height: 32),
              const SizedBox(width: 14),
              const Text(
                'Soru Çözmeye Başla',
                style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
