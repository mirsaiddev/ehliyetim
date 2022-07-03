import 'package:ehliyetim/models/quiz.dart';
import 'package:ehliyetim/screens/Quiz/quiz_screen.dart';
import 'package:ehliyetim/services/api_service.dart';
import 'package:ehliyetim/widgets/day_widget.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/months.dart';
import '../../../../widgets/custom_app_bar.dart';

class MonthScreen extends StatelessWidget {
  const MonthScreen({Key? key, required this.year, required this.month}) : super(key: key);

  final int year;
  final int month;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          CustomAppBar(text: '${months[month - 1]} ${year}'),
          SizedBox(height: 20),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.builder(
                itemCount: daysPerMonth[month - 1],
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2.5,
                  mainAxisSpacing: 6,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: ((context, index) {
                  return DayWidget(
                    onTap: () async {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => QuizScreen(year: year, month: month, day: index + 1)));
                    },
                    month: month,
                    year: year,
                    day: index + 1,
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
