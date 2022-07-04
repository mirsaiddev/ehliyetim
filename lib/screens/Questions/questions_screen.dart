import 'package:ehliyetim/screens/Quiz/quiz_screen.dart';
import 'package:ehliyetim/theme/colors.dart';
import 'package:ehliyetim/widgets/month_card.dart';
import 'package:flutter/material.dart';
import '../../data/questions_data.dart';
import '../../utils/constants/assets.dart';
import '../../utils/constants/months.dart';
import 'SubScreens/Month/month_screen.dart';

class QuestionsScreen extends StatelessWidget {
  const QuestionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 9,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: MyColors.purpleLight,
                        image: DecorationImage(
                          image: AssetImage(Assets.pattern1),
                        ),
                      ),
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      height: 63,
                      child: Center(
                        child: Text(
                          'Kategoriler',
                          style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                    Container(
                      height: 63,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: TabBar(
                        isScrollable: true,
                        labelStyle: TextStyle(fontWeight: FontWeight.w700, fontFamily: 'ReadexPro'),
                        indicatorColor: Theme.of(context).tabBarTheme.labelColor,
                        overlayColor: MaterialStateProperty.all(Colors.transparent),
                        tabs: [
                          for (var i = 0; i < 9; i++)
                            Tab(
                              text: oldYearQuizs.keys.toList()[i].toString(),
                              icon: SizedBox(),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    for (var i = 0; i < 9; i++)
                      Builder(
                        builder: (context) {
                          var entries = oldYearQuizs.entries.toList()[i];
                          if (entries.key == 2020 || entries.key == 2021 || entries.key == 2022) {
                            return ListView.builder(
                              itemCount: availableMonthsPerYear[entries.key],
                              itemBuilder: (context, index) {
                                return MonthCard(
                                  notAccessible: index > 2,
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => MonthScreen(
                                          year: entries.key,
                                          month: index + 1,
                                        ),
                                      ),
                                    );
                                  },
                                  text: '${months[index]} ${entries.key} Ehliyet Sınavı Soruları',
                                );
                              },
                            );
                          }
                          return ListView.builder(
                            itemCount: entries.value.length,
                            itemBuilder: (context, index) {
                              return MonthCard(
                                notAccessible: index > 0,
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => QuizScreen(
                                        year: entries.value[index].year,
                                        month: entries.value[index].month,
                                        day: entries.value[index].day,
                                        quizName: entries.value[index].title,
                                      ),
                                    ),
                                  );
                                },
                                text: '${entries.value[index].title}',
                              );
                            },
                          );
                        },
                      ),
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
