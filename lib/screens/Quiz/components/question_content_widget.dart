import 'package:ehliyetim/models/question_object.dart';
import 'package:flutter/material.dart';

class QuestionContentWidget extends StatelessWidget {
  const QuestionContentWidget({
    Key? key,
    required this.content,
    required this.questionObject,
  }) : super(key: key);

  final String content;
  final QuestionObject questionObject;

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: TextStyle(
        fontSize: 14,
        fontWeight: questionObject.contents.indexOf(content) == questionObject.questionBodyIndexIncontents ? FontWeight.bold : FontWeight.w400,
      ),
    );
  }
}
