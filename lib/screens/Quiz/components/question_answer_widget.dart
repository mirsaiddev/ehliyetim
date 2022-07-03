import 'package:ehliyetim/models/question_object.dart';
import 'package:ehliyetim/theme/colors.dart';
import 'package:ehliyetim/utils/extensions/string.dart';
import 'package:flutter/material.dart';

import '../../../models/solved_question.dart';
import '../../../providers/quiz_provider.dart';

class QuestionAnswersWidget extends StatelessWidget {
  const QuestionAnswersWidget({
    Key? key,
    required this.questionObject,
    required this.quizProvider,
    required this.index,
  }) : super(key: key);

  final QuestionObject questionObject;
  final QuizProvider quizProvider;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var answer in questionObject.answers)
            Builder(builder: (context) {
              int answerIndex = questionObject.answers.indexOf(answer);
              List<SolvedQuestion> solvedQuestions = quizProvider.solvedQuestions;
              bool isSolved = quizProvider.solvedQuestions.any((element) => element.questionNumber == index);
              bool isCorrect = isSolved ? solvedQuestions.where((element) => element.questionNumber == index).first.isCorrect : false;
              int correctAnswerIndex = questionObject.correctAnswer.toAnswerIndex();
              int myAnswerIndex = isSolved ? solvedQuestions.where((element) => element.questionNumber == index).first.answerIndex : -1;

              Color cardColor;
              if (isCorrect) {
                cardColor = correctAnswerIndex == answerIndex ? MyColors.green : MyColors.greyLightest;
              } else {
                cardColor = myAnswerIndex == answerIndex ? MyColors.red : MyColors.greyLightest;
              }
              if (isSolved) {
                cardColor = correctAnswerIndex == answerIndex ? MyColors.green : cardColor;
              } else {
                cardColor = MyColors.greyLightest;
              }
              Color textColor;
              if (cardColor != MyColors.greyLightest) {
                textColor = Colors.white;
              } else {
                textColor = Colors.black;
              }
              return GestureDetector(
                onTap: () {
                  if (!isSolved && !quizProvider.quizCompleted) {
                    quizProvider.solveQuestion(questionNumber: index, answerIndex: answerIndex);
                  }
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: cardColor,
                  ),
                  padding: EdgeInsets.all(16),
                  width: double.infinity,
                  child: Builder(builder: (context) {
                    if (answer.contains('img:')) {
                      return Image.network(
                        answer.replaceAll('img:', ''),
                        height: 50,
                      );
                    }
                    return Text(
                      answer,
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: textColor),
                    );
                  }),
                ),
              );
            }),
        ],
      ),
    );
  }
}
