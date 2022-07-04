import 'package:ehliyetim/theme/colors.dart';
import 'package:ehliyetim/utils/constants/assets.dart';
import 'package:flutter/material.dart';

import '../../widgets/start_button.dart';
import '../../widgets/todays_tip_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: CircleAvatar(backgroundColor: MyColors.greyLight)),
            Center(
              child: Text('Ehliyetim', style: TextStyle(fontWeight: FontWeight.w700)),
            ),
            SizedBox(height: 30),
            StartButton(),
            SizedBox(height: 20),
            TodaysTipWidget(),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('İstatistiklerim', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      StatisticWidget(text: 'Bugün Çözülen \nSoru Sayısı', image: Assets.answer, value: '283'),
                      SizedBox(width: 10),
                      StatisticWidget(text: 'Bugün Öğrenilen \nKonu Sayısı', image: Assets.lesson, value: '283'),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      StatisticWidget(text: 'Doğru Cevap \nSayısı', image: Assets.check, value: '283'),
                      SizedBox(width: 10),
                      StatisticWidget(text: 'Yanlış Cevap \nSayısı', image: Assets.remove, value: '283'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

class StatisticWidget extends StatelessWidget {
  const StatisticWidget({
    Key? key,
    required this.text,
    required this.image,
    required this.value,
  }) : super(key: key);

  final String text;
  final String image;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(color: Theme.of(context).colorScheme.onBackground, borderRadius: BorderRadius.circular(5)),
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(image, height: 26),
            SizedBox(height: 10),
            Text(text, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                value,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
