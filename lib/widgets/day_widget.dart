import 'package:ehliyetim/models/quiz_metadata.dart';
import 'package:ehliyetim/providers/statistics_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme/colors.dart';
import '../utils/constants/months.dart';

class DayWidget extends StatelessWidget {
  const DayWidget({
    Key? key,
    required this.month,
    required this.year,
    required this.day,
    this.notAccessible = false,
    this.onTap,
    required this.quizMetadata,
  }) : super(key: key);

  final int month;
  final int year;
  final int day;
  final bool notAccessible;

  final Function()? onTap;
  final QuizMetadata quizMetadata;

  @override
  Widget build(BuildContext context) {
    StatisticsProvider statisticsProvider = Provider.of<StatisticsProvider>(context);
    bool solved = statisticsProvider.isThisQuizSolved(quizMetadata);
    return GestureDetector(
      onTap: notAccessible || solved ? () {} : onTap,
      child: Opacity(
        opacity: notAccessible ? 1 : 1,
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onBackground,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$day ${months[month - 1]} $year',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              solved
                  ? Icon(
                      Icons.check,
                      color: MyColors.green,
                      size: 20,
                    ) //Image.asset(Assets.check, height: 20)
                  : Icon(
                      notAccessible ? Icons.lock : Icons.arrow_forward_ios,
                      color: MyColors.purpleLight,
                      size: 18,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
