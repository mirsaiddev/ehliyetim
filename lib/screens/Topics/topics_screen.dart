import 'package:ehliyetim/utils/constants/assets.dart';
import 'package:ehliyetim/widgets/custom_app_bar.dart';
import 'package:ehliyetim/widgets/topics_list_widget.dart';
import 'package:flutter/material.dart';

class TopicsScreen extends StatelessWidget {
  const TopicsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
