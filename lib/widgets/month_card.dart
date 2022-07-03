import 'dart:math' as math;
import 'package:ehliyetim/utils/constants/assets.dart';
import 'package:flutter/material.dart';

import '../theme/colors.dart';

class MonthCard extends StatelessWidget {
  const MonthCard({
    Key? key,
    required this.text,
    this.onTap,
  }) : super(key: key);

  final String text;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5)),
        child: Stack(
          children: [
            Positioned(
                right: -10,
                bottom: -20,
                child: Transform.rotate(
                  angle: -math.pi / 8,
                  child: Image.asset(
                    Assets.calendar,
                    height: 70,
                    color: MyColors.purpleLight.withOpacity(0.1),
                  ),
                )),
            Container(
              width: 260,
              height: 80,
              decoration: BoxDecoration(color: Colors.transparent, borderRadius: BorderRadius.circular(5)),
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  Image.asset(Assets.calendar, height: 40, color: MyColors.purpleLight),
                  SizedBox(width: 10),
                  Flexible(
                    child: Text(
                      text,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
