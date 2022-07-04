import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../utils/constants/assets.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    required this.text,
    this.backButton = false,
    this.backgroundImage = Assets.pattern1,
  }) : super(key: key);

  final String text;
  final String backgroundImage;
  final bool backButton;

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
        child: Builder(builder: (context) {
          if (backButton) {
            return Row(
              children: [
                SizedBox(width: 4),
                IconButton(
                  icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      text,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.arrow_back_outlined, color: Colors.transparent),
                  onPressed: null,
                ),
                SizedBox(width: 4),
              ],
            );
          }
          return Center(
            child: Text(
              text,
              style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700),
            ),
          );
        }),
      ),
    );
  }
}
