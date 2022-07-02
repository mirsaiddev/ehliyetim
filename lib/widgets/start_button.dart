import 'package:ehliyetim/theme/colors.dart';
import 'package:flutter/material.dart';

import '../utils/constants/assets.dart';

class StartButton extends StatelessWidget {
  const StartButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: MyColors.purple,
        image: DecorationImage(
          image: AssetImage(Assets.pattern1),
        ),
      ),
      margin: EdgeInsets.symmetric(horizontal: 10),
      height: 78,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 14),
            Image.asset(Assets.brain, height: 32),
            SizedBox(width: 14),
            Text(
              'Soru Çözmeye Başla',
              style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
