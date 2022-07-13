import 'package:ehliyetim/models/question_object.dart';
import 'package:ehliyetim/models/quiz.dart';
import 'package:ehliyetim/providers/quiz_provider.dart';
import 'package:ehliyetim/theme/colors.dart';
import 'package:ehliyetim/utils/constants/assets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/finish_quiz_widgets.dart';
import 'components/question_answer_widget.dart';
import 'components/question_content_widget.dart';
import 'components/question_image_widget.dart';
import 'components/quiz_info_bar.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key, required this.year, required this.month, required this.day, this.quizName}) : super(key: key);

  final int year;
  final int month;
  final int day;
  final String? quizName;

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  Future<void> getQuiz() async {
    QuizProvider quizProvider = Provider.of<QuizProvider>(context, listen: false);
    await quizProvider.getQuiz(year: widget.year, month: widget.month, day: widget.day);
    if (quizProvider.quiz!.quizName == '') {
      quizProvider.quiz!.quizName = widget.quizName ?? '';
    }
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
      floatingActionButton: quizProvider.currentQuestion == 0
          ? GestureDetector(
              onTap: () {
                quizProvider.nextQuestion();
              },
              child: Image.asset(Assets.arrow, color: MyColors.purpleLight, height: 40))
          : null,
      appBar: AppBar(
        automaticallyImplyLeading: quizProvider.quizGet ? true : false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        actions: [
          if (quizProvider.quizGet && !quizProvider.quizCompleted)
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: TextButton(
                style: TextButton.styleFrom(
                  primary: MyColors.purpleLight,
                ),
                onPressed: () {
                  showDialog(context: context, builder: (context) => const FinishQuizDialog());
                },
                child: const Text(
                  'Testi Bitir',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ),
            )
          else if (quizProvider.quizCompleted)
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: TextButton(
                style: TextButton.styleFrom(
                  primary: MyColors.purpleLight,
                ),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    enableDrag: false,
                    backgroundColor: Colors.transparent,
                    builder: (context) => FinishQuizBottomSheet(quizProvider: quizProvider),
                  );
                },
                child: const Text(
                  'Test Sonucu',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ),
            )
        ],
        title: Column(
          children: [
            Center(
                child: Image.asset(
              'lib/assets/images/logo.png',
              height: 40,
              color: Theme.of(context).colorScheme.onTertiary,
            )),
            Text(
              'Ehliyetim',
              style: TextStyle(
                color: Theme.of(context).appBarTheme.iconTheme!.color!,
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
            const SizedBox(height: 10),
            const QuizInfoBar(),
            const SizedBox(height: 10),
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
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Theme.of(context).colorScheme.onBackground,
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
                          const SizedBox(height: 10),
                          QuestionAnswersWidget(
                            questionObject: questionObject,
                            quizProvider: quizProvider,
                            index: index,
                          )
                        ],
                      ),
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
