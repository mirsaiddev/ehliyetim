import 'package:ehliyetim/providers/statistics_provider.dart';
import 'package:ehliyetim/widgets/statistic_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/constants/assets.dart';

class StatisticsSection extends StatelessWidget {
  const StatisticsSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    StatisticsProvider statisticsProvider = Provider.of<StatisticsProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('İstatistiklerim', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
          const SizedBox(height: 20),
          Row(
            children: [
              StatisticWidget(text: 'Bugün Çözülen \nTest Sayısı', image: Assets.answer, value: '21'), //'${statisticsProvider.todaysSolvedQuizsLength()}'
              const SizedBox(width: 10),
              StatisticWidget(text: 'Bugün Öğrenilen \nKonu Sayısı', image: Assets.lesson, value: '7'), //statisticsProvider.todaysTopics.length.toString()
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              StatisticWidget(text: 'Doğru Cevap \nSayısı', image: Assets.check, value: '153'), //'${statisticsProvider.todaysCorrectAnswers()}'
              const SizedBox(width: 10),
              StatisticWidget(text: 'Yanlış Cevap \nSayısı', image: Assets.remove, value: '52'), //'${statisticsProvider.todaysWrongAnswers()}'
            ],
          ),
        ],
      ),
    );
  }
}
