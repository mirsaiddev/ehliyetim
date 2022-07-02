import 'package:ehliyetim/widgets/year_section.dart';
import 'package:flutter/material.dart';
import '../../widgets/custom_app_bar.dart';

class QuestionsScreen extends StatelessWidget {
  const QuestionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(text: 'Kategoriler'),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    YearSection(year: 2022, availableMonthsCount: 7),
                    SizedBox(height: 20),
                    YearSection(year: 2021, availableMonthsCount: 12),
                    SizedBox(height: 20),
                    YearSection(year: 2020, availableMonthsCount: 12),
                    SizedBox(height: 500),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
