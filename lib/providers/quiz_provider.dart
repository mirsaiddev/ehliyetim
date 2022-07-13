import 'dart:async';

import 'package:ehliyetim/models/quiz.dart';
import 'package:ehliyetim/models/quiz_metadata.dart';
import 'package:ehliyetim/models/solved_question.dart';
import 'package:ehliyetim/models/solved_quiz.dart';
import 'package:ehliyetim/services/api_service.dart';
import 'package:ehliyetim/services/hive_service.dart';
import 'package:ehliyetim/utils/extensions/string.dart';
import 'package:flutter/material.dart';

class QuizProvider extends ChangeNotifier {
  Quiz? quiz;
  QuizMetadata? quizMetadata;

  PageController pageController = PageController(initialPage: 0);

  bool quizGet = false;
  bool quizCompleted = false;

  Duration time = Duration.zero;

  Timer? timer;

  Future<void> completeQuiz() async {
    quizCompleted = true;
    if (timer != null) {
      timer!.cancel();
    }
    SolvedQuiz solvedQuiz = SolvedQuiz(
      quizMetadata: quizMetadata!,
      duration: time,
      correctAnswers: correctAnswers(),
      wrongAnswers: wrongAnswers(),
      totalQuestions: quiz!.questionObjects.length,
    );

    await HiveService().addSolvedQuiz(solvedQuiz);
    notifyListeners();
  }

  int correctAnswers() {
    int correctQuestions = solvedQuestions.where((element) => element.isCorrect).length;
    return correctQuestions;
  }

  int wrongAnswers() {
    int wrongQuestions = solvedQuestions.where((element) => !element.isCorrect).length;
    return wrongQuestions;
  }

  int currentQuestion = 0;

  List<SolvedQuestion> solvedQuestions = [];

  void solveQuestion({required int questionNumber, required int answerIndex}) {
    solvedQuestions.add(SolvedQuestion(
      questionNumber: questionNumber,
      answerIndex: answerIndex,
      isCorrect: quiz!.questionObjects[questionNumber].correctAnswer.toAnswerIndex() == answerIndex,
    ));
    notifyListeners();
  }

  void setCurrentQuestion(int index) {
    currentQuestion = index;
    notifyListeners();
  }

  void init() {
    quizCompleted = false;
    currentQuestion = 0;
    pageController = PageController(initialPage: 0);
    time = Duration.zero;
    quizGet = false;
    solvedQuestions = [];
    cancelTimer();
  }

  Future<void> getQuiz({required int year, required int month, required int day}) async {
    init();

    quiz = await ApiService().getQuiz(year: year, month: month, day: day);
    quizMetadata = QuizMetadata(year: year, month: month, day: day);
    startTimer();
    quizGet = true;
    notifyListeners();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      time = time + const Duration(seconds: 1);
      notifyListeners();
    });
  }

  void notify() {
    notifyListeners();
  }

  void cancelTimer() {
    if (timer != null) {
      timer?.cancel();
    }
  }

  void nextQuestion() {
    if (currentQuestion < quiz!.questionObjects.length - 1) {
      currentQuestion++;
      pageController.animateToPage(currentQuestion, duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
    }
  }
}
