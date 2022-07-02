import 'package:ehliyetim/utils/constants/topic_data.dart';
import 'package:ehliyetim/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class TopicDetailScreen extends StatefulWidget {
  const TopicDetailScreen({Key? key, required this.topicKey, required this.index}) : super(key: key);
  final String topicKey;
  final int index;

  @override
  State<TopicDetailScreen> createState() => _TopicDetailScreenState();
}

class _TopicDetailScreenState extends State<TopicDetailScreen> {
  void getTopicData() {
    //* https://ehliyet-api.herokuapp.com/getTopics?topic=trafik-cevre&index=4
    //* https://ehliyet-api.herokuapp.com/getTopics?topic=${topicKey}&index=$index
    //* returns pure html
  }

  @override
  void initState() {
    super.initState();
    getTopicData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(text: keysDetail[widget.topicKey][widget.index]),
          ],
        ),
      ),
    );
  }
}
