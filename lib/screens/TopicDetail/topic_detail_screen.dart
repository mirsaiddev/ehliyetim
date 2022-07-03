import 'package:ehliyetim/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:http/http.dart' as http;

import '../../utils/constants/topic_data.dart';
import '../../widgets/custom_app_bar.dart';

class TopicDetailScreen extends StatefulWidget {
  TopicDetailScreen({Key? key, required this.topicKey, required this.index}) : super(key: key);
  final String topicKey;
  final int index;
  @override
  State<TopicDetailScreen> createState() => _TopicDetailScreenState();
}

class _TopicDetailScreenState extends State<TopicDetailScreen> {
  String htmlCode = '';

  void getTopicData() async {
    String? htmlToParse = await ApiService().getTopic(topicKey: widget.topicKey, index: widget.index + 1);
    if (htmlToParse != null) {
      setState(() {
        htmlCode = htmlToParse;
      });
    }
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
            CustomAppBar(
              text: keysDetail[widget.topicKey][widget.index],
              backButton: true,
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
                child: SingleChildScrollView(child: Html(data: htmlCode)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
