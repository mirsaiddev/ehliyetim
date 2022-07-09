import 'package:ehliyetim/providers/statistics_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme/colors.dart';

class TopicWidget extends StatelessWidget {
  const TopicWidget({
    Key? key,
    required this.text,
    this.onTap,
    this.notAccessible = false,
  }) : super(key: key);

  final String text;
  final Function()? onTap;
  final bool notAccessible;

  @override
  Widget build(BuildContext context) {
    StatisticsProvider statisticsProvider = Provider.of<StatisticsProvider>(context);
    List<String> todaysTopics = statisticsProvider.todaysTopics;
    bool seen = todaysTopics.contains(text);
    return GestureDetector(
      onTap: notAccessible || seen ? () {} : onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onBackground,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                text,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
            ),
            seen
                ? Icon(
                    Icons.check,
                    color: MyColors.green,
                    size: 20,
                  )
                : Icon(
                    notAccessible ? Icons.lock : Icons.arrow_forward_ios,
                    color: MyColors.purpleLight,
                    size: notAccessible ? 22 : 18,
                  ),
          ],
        ),
      ),
    );
  }
}
