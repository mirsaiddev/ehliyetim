import 'package:ehliyetim/providers/home_provider.dart';
import 'package:ehliyetim/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'dart:math' as math;
import '../utils/constants/assets.dart';

class TodaysTipWidget extends StatelessWidget {
  const TodaysTipWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeProvider homeProvider = Provider.of<HomeProvider>(context);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(color: MyColors.purpleLight, borderRadius: BorderRadius.circular(5)),
      child: Stack(
        children: [
          Positioned(
              right: -100,
              bottom: -50,
              child: Transform.rotate(
                angle: -math.pi / 100,
                child: Opacity(
                  opacity: 0.5,
                  child: Image.asset(
                    Assets.car,
                    height: 180,
                  ),
                ),
              )),
          Container(
            height: 150,
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.transparent, borderRadius: BorderRadius.circular(5)),
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(Assets.wheel, height: 24, color: Colors.white),
                const SizedBox(height: 6),
                const Text(
                  'Günün ipucu',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16),
                ),
                const SizedBox(height: 6),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Text(
                      homeProvider.hint ?? '',
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w400, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
