import 'package:ehliyetim/providers/statistics_provider.dart';
import 'package:ehliyetim/utils/constants/assets.dart';
import 'package:ehliyetim/widgets/custom_app_bar.dart';
import 'package:ehliyetim/widgets/topics_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yodo1mas/testmasfluttersdktwo.dart';

class TopicsScreen extends StatefulWidget {
  const TopicsScreen({Key? key}) : super(key: key);

  @override
  State<TopicsScreen> createState() => _TopicsScreenState();
}

class _TopicsScreenState extends State<TopicsScreen> {
  void getTopics() {
    StatisticsProvider statisticsProvider = Provider.of<StatisticsProvider>(context, listen: false);
    statisticsProvider.getTopics();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getTopics();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            CustomAppBar(text: 'Ders Notları'),
            SizedBox(height: 20),
            TopicsListWidget(topicKey: 'ilk-yardim', text: 'İlk Yardım Ders Notları', image: Assets.firstAid),
            SizedBox(height: 20),
            TopicsListWidget(topicKey: 'trafik-cevre', text: 'Trafik ve Çevre Ders Notları', image: Assets.traffic),
            SizedBox(height: 20),
            TopicsListWidget(topicKey: 'arac-teknigi', text: 'Motor ve Araç Tekniği Ders Notları', image: Assets.motorcycle),
            SizedBox(height: 20),
            TopicsListWidget(topicKey: 'trafik-adabi', text: 'Trafik Adabı Ders Notları', image: Assets.trafficBook),
          ],
        ),
      ),
    );
  }
}
