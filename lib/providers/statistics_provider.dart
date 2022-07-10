import 'package:ehliyetim/models/quiz_metadata.dart';
import 'package:ehliyetim/models/solved_quiz.dart';
import 'package:flutter/material.dart';

import '../services/hive_service.dart';

class StatisticsProvider extends ChangeNotifier {
  List<SolvedQuiz> allSolvedQuizs = [];
  List<SolvedQuiz> todaysSolvedQuizs = [];
  List<String> todaysTopics = [];
  List<String> allTopics = [];
  bool allSolvedQuizsGet = false;

  bool isThisQuizSolved(QuizMetadata quizMetadata) {
    for (SolvedQuiz solvedQuiz in allSolvedQuizs) {
      if (solvedQuiz.quizMetadata.day == quizMetadata.day &&
          solvedQuiz.quizMetadata.month == quizMetadata.month &&
          solvedQuiz.quizMetadata.year == quizMetadata.year) {
        return true;
      }
    }
    return false;
  }

  int todaysSolvedQuizsLength() {
    return todaysSolvedQuizs.length;
  }

  int todaysCorrectAnswers() {
    if (todaysSolvedQuizs.isEmpty) {
      return 0;
    }
    return todaysSolvedQuizs.map((e) => e.correctAnswers).reduce((a, b) => a + b);
  }

  int todaysWrongAnswers() {
    if (todaysSolvedQuizs.isEmpty) {
      return 0;
    }
    return todaysSolvedQuizs.map((e) => e.wrongAnswers).reduce((a, b) => a + b);
  }

  Future<void> getSolvedQuizs() async {
    allSolvedQuizs = await HiveService().getAllSolvedQuizList();
    todaysSolvedQuizs = await HiveService().getTodaysSolvedQuizList();
    allSolvedQuizsGet = true;
    notifyListeners();
  }

  Future<void> getTopics() async {
    todaysTopics = await HiveService().getTopics();
    allTopics = await HiveService().getAllTopics();
    notifyListeners();
  }
}
