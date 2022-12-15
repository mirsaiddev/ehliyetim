import 'dart:math' as math;
import 'package:ehliyetim/providers/splash_provider.dart';
import 'package:ehliyetim/utils/constants/assets.dart';
import 'package:ehliyetim/widgets/premium_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme/colors.dart';

class MonthCard extends StatelessWidget {
  const MonthCard({Key? key, required this.text, this.onTap, this.notAccessible = false}) : super(key: key);

  final String text;
  final Function()? onTap;
  final bool notAccessible;

  @override
  Widget build(BuildContext context) {
    bool notAccessible = this.notAccessible;
    SplashProvider splashProvider = Provider.of<SplashProvider>(context);
    if (splashProvider.isPremium) {
      notAccessible = false;
    }
    return GestureDetector(
      onTap: (notAccessible) && !splashProvider.isPremium
          ? () {
              showPremiumBottomSheet(context);
            }
          : onTap,
      child: Opacity(
        opacity: notAccessible ? 1 : 1,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
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
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    notAccessible
                        ? Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 6.0),
                            child: Image.asset(Assets.lock, height: 30, color: MyColors.purpleLight),
                          )
                        : Image.asset(Assets.calendar, height: 40, color: MyColors.purpleLight),
                    const SizedBox(width: 10),
                    Flexible(
                      child: Text(
                        text,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(width: 60),
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
