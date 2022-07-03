import 'package:flutter/material.dart';

class QuestionImageWidget extends StatelessWidget {
  const QuestionImageWidget({
    Key? key,
    required this.content,
  }) : super(key: key);

  final String content;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Image.network(content.replaceFirst('img:', '')),
    ));
  }
}
