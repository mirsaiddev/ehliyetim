import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../utils/constants/assets.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    required this.text,
    this.backgroundImage = Assets.pattern1,
  }) : super(key: key);

  final String text;
  final String backgroundImage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: MyColors.purpleLight,
          image: DecorationImage(
            image: AssetImage(backgroundImage),
          ),
        ),
        margin: EdgeInsets.symmetric(horizontal: 10),
        height: 63,
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
