import 'package:ehliyetim/screens/Questions/SubScreens/Month/month_screen.dart';
import 'package:ehliyetim/utils/constants/months.dart';
import 'package:flutter/material.dart';

import 'month_card.dart';

class YearSection extends StatelessWidget {
  const YearSection({
    Key? key,
    required this.year,
    required this.availableMonthsCount,
  }) : super(key: key);

  final int year;
  final int availableMonthsCount;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text(
            '$year',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              const SizedBox(width: 4),
              for (var i = 0; i < availableMonthsCount; i++)
                MonthCard(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MonthScreen(
                          year: year,
                          month: i + 1,
                        ),
                      ),
                    );
                  },
                  text: '${months[i]} $year Ehliyet Sınavı Soruları',
                ),
            ],
          ),
        ),
      ],
    );
  }
}
