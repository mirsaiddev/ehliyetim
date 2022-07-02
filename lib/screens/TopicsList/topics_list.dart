import 'package:ehliyetim/screens/TopicDetail/topic_detail_screen.dart';
import 'package:ehliyetim/theme/colors.dart';
import 'package:ehliyetim/utils/constants/topic_data.dart';
import 'package:ehliyetim/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

import '../../widgets/topics_widget.dart';

class TopicsList extends StatelessWidget {
  const TopicsList({Key? key, required this.topicKey}) : super(key: key);

  final String topicKey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(text: '${topicKeyToString[topicKey]} Ders Notları'),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: keysDetail[topicKey].length,
                itemBuilder: (context, index) {
                  return TopicWidget(
                    text: keysDetail[topicKey][index],
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TopicDetailScreen(topicKey: topicKey, index: index),
                        ),
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
