import 'package:ehliyetim/providers/home_provider.dart';
import 'package:ehliyetim/providers/statistics_provider.dart';
import 'package:ehliyetim/services/api_service.dart';
import 'package:ehliyetim/theme/colors.dart';
import 'package:ehliyetim/utils/constants/assets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/start_button.dart';
import '../../widgets/statistic_widget.dart';
import '../../widgets/statistics_section.dart';
import '../../widgets/todays_tip_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> getHint() async {
    HomeProvider homeProvider = Provider.of<HomeProvider>(context, listen: false);
    homeProvider.getHint();
  }

  void getStatistics() {
    StatisticsProvider statisticsProvider = Provider.of<StatisticsProvider>(context, listen: false);
    statisticsProvider.getSolvedQuizs();
  }

  @override
  void initState() {
    super.initState();
    getHint();
    getStatistics();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: CircleAvatar(backgroundColor: MyColors.greyLight)),
            Center(child: Text('Ehliyetim', style: TextStyle(fontWeight: FontWeight.w700))),
            SizedBox(height: 30),
            StartButton(),
            SizedBox(height: 20),
            TodaysTipWidget(),
            SizedBox(height: 30),
            StatisticsSection(),
          ],
        ),
      ),
    ));
  }
}
