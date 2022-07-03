import 'package:ehliyetim/models/quiz.dart';
import 'package:flutter/material.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({Key? key, required this.quiz}) : super(key: key);

  final Quiz quiz;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('${quiz.quizName}')),
    );
  }
}
