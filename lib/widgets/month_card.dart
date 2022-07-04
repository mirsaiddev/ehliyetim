import 'dart:math' as math;
import 'package:ehliyetim/utils/constants/assets.dart';
import 'package:flutter/material.dart';

import '../theme/colors.dart';

class MonthCard extends StatelessWidget {
  const MonthCard({Key? key, required this.text, this.onTap, this.notAccessible = false}) : super(key: key);

  final String text;
  final Function()? onTap;
  final bool notAccessible;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: notAccessible ? () {} : onTap,
      child: Opacity(
        opacity: notAccessible ? 1 : 1,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(color: Theme.of(context).colorScheme.onBackground, borderRadius: BorderRadius.circular(5)),
          child: Stack(
            children: [
              Positioned(
                  right: -10,
                  bottom: -20,
                  child: Transform.rotate(
                    angle: -math.pi / 8,
                    child: Image.asset(
                      notAccessible ? Assets.lock : Assets.calendar,
                      height: notAccessible ? 70 : 80,
                      scale: 0.5,
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                  )),
              Container(
                height: 80,
                decoration: BoxDecoration(color: Colors.transparent, borderRadius: BorderRadius.circular(5)),
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    notAccessible
                        ? Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 6.0),
                            child: Image.asset(Assets.lock, height: 30, color: MyColors.purpleLight),
                          )
                        : Image.asset(Assets.calendar, height: 40, color: MyColors.purpleLight),
                    SizedBox(width: 10),
                    Flexible(
                      child: Text(
                        text,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(width: 60),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
