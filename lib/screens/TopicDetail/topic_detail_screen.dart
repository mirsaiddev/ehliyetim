import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:http/http.dart' as http;

import '../../utils/constants/topic_data.dart';
import '../../widgets/custom_app_bar.dart';

class TopicDetailScreen extends StatefulWidget {
  TopicDetailScreen({Key? key, required this.topicKey, required this.index})
      : super(key: key);
  final String topicKey;
  final int index;
  String htmlCode = '';
  @override
  State<TopicDetailScreen> createState() => _TopicDetailScreenState();
}

class _TopicDetailScreenState extends State<TopicDetailScreen> {
  void getTopicData(String url) async {
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      String htmlToParse = response.body;
      widget.htmlCode = htmlToParse;
    }

    //* https://ehliyet-api.herokuapp.com/getTopics?topic=trafik-cevre&index=4
    //* https://ehliyet-api.herokuapp.com/getTopics?topic=${topicKey}&index=$index
    //* returns pure html
  }

  @override
  void initState() {
    super.initState();
    getTopicData(
        'https://ehliyet-api.herokuapp.com/getTopics?topic=trafik-cevre&index=4');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(text: keysDetail[widget.topicKey][widget.index]),
              Html(
                data: widget.htmlCode,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
