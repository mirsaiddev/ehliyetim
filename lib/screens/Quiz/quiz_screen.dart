import 'package:ehliyetim/models/question_object.dart';
import 'package:ehliyetim/models/quiz.dart';
import 'package:ehliyetim/models/solved_question.dart';
import 'package:ehliyetim/providers/quiz_provider.dart';
import 'package:ehliyetim/theme/colors.dart';
import 'package:ehliyetim/utils/constants/assets.dart';
import 'package:ehliyetim/utils/extensions/duration.dart';
import 'package:ehliyetim/utils/extensions/string.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key, required this.year, required this.month, required this.day}) : super(key: key);

  final int year;
  final int month;
  final int day;

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  void getQuiz() {
    QuizProvider quizProvider = Provider.of<QuizProvider>(context, listen: false);
    quizProvider.getQuiz(year: widget.year, month: widget.month, day: widget.day);
  }

  @override
  void initState() {
    super.initState();
    getQuiz();
  }

  @override
  Widget build(BuildContext context) {
    QuizProvider quizProvider = Provider.of<QuizProvider>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        title: Column(
          children: [
            CircleAvatar(
              backgroundColor: MyColors.greyLight,
            ),
            Text(
              'Ehliyetim',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
      body: Builder(builder: (context) {
        if (!quizProvider.quizGet) {
          return Center(
            child: CircularProgressIndicator(color: MyColors.purpleLight),
          );
        }
        Quiz quiz = quizProvider.quiz!;
        return Column(
          children: [
            SizedBox(height: 10),
            QuizInfoBar(),
            SizedBox(height: 10),
            Expanded(
              child: PageView.builder(
                onPageChanged: (index) {
                  quizProvider.setCurrentQuestion(index);
                },
                controller: quizProvider.pageController,
                itemCount: quiz.questionObjects.length,
                itemBuilder: (context, index) {
                  QuestionObject questionObject = quiz.questionObjects[index];
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              for (var content in questionObject.contents)
                                content.contains('img:')
                                    ? QuestionImageWidget(content: content)
                                    : QuestionContentWidget(content: content, questionObject: questionObject),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
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
                                    cardColor = correctAnswerIndex == answerIndex ? Colors.green : MyColors.greyLightest;
                                  } else {
                                    cardColor = myAnswerIndex == answerIndex ? Colors.red : MyColors.greyLightest;
                                  }
                                  if (isSolved) {
                                    cardColor = correctAnswerIndex == answerIndex ? Colors.green : cardColor;
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
                                      quizProvider.solveQuestion(questionNumber: index, answerIndex: answerIndex);
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
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        );
      }),
    );
  }
}

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
          fontSize: 14, fontWeight: questionObject.contents.indexOf(content) == questionObject.questionBodyIndexIncontents ? FontWeight.bold : FontWeight.w400),
    );
  }
}

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
