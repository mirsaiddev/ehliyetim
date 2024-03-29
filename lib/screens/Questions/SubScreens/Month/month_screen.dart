import 'package:ehliyetim/models/quiz_metadata.dart';
import 'package:ehliyetim/providers/splash_provider.dart';
import 'package:ehliyetim/screens/Quiz/quiz_screen.dart';
import 'package:ehliyetim/widgets/day_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yodo1mas/Yodo1MasBannerAd.dart';

import '../../../../utils/constants/months.dart';
import '../../../../widgets/custom_app_bar.dart';

class MonthScreen extends StatelessWidget {
  const MonthScreen({Key? key, required this.year, required this.month}) : super(key: key);

  final int year;
  final int month;

  @override
  Widget build(BuildContext context) {
    SplashProvider splashProvider = Provider.of<SplashProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(
              text: '${months[month - 1]} $year',
              backButton: true,
            ),
            const SizedBox(height: 20),
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
                      notAccessible: index > 5,
                      quizMetadata: QuizMetadata(
                        year: year,
                        month: month,
                        day: index + 1,
                      ),
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
      ),
      bottomNavigationBar: splashProvider.isPremium
          ? null
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Yodo1MASBannerAd(
                  size: BannerSize.Banner,
                  onLoad: () => print('Banner loaded:'),
                  onOpen: () => print('Banner clicked:'),
                  onClosed: () => print('Banner clicked:'),
                  onLoadFailed: (message) => print('Banner Ad $message failed'),
                  onOpenFailed: (message) => print('Banner Ad $message open failed'),
                ),
              ],
            ),
    );
  }
}
