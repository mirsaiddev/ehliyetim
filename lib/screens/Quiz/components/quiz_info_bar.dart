import 'package:ehliyetim/utils/extensions/duration.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/quiz_provider.dart';
import '../../../utils/constants/assets.dart';

class QuizInfoBar extends StatelessWidget {
  const QuizInfoBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuizProvider quizProvider = Provider.of<QuizProvider>(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(Assets.clock, height: 20),
              SizedBox(width: 6),
              Text('${quizProvider.time.visualize()}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            ],
          ),
          Row(
            children: [
              Row(
                children: [
                  Image.asset(Assets.check, height: 20),
                  SizedBox(width: 6),
                  Text('${quizProvider.correctAnswers()}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                ],
              ),
              SizedBox(width: 12),
              Row(
                children: [
                  Image.asset(Assets.remove, height: 20),
                  SizedBox(width: 6),
                  Text('${quizProvider.wrongAnswers()}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                ],
              )
            ],
          ),
          Row(
            children: [
              Row(
                children: [
                  Image.asset(Assets.question, height: 20),
                  SizedBox(width: 6),
                  Text('${quizProvider.currentQuestion + 1}/${quizProvider.quiz!.questionObjects.length}',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
