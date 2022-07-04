import 'package:ehliyetim/models/quiz_metadata.dart';
import 'package:ehliyetim/models/solved_quiz.dart';
import 'package:flutter/material.dart';

import '../services/hive_service.dart';

class StatisticsProvider extends ChangeNotifier {
  List<SolvedQuiz> allSolvedQuizs = [];
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

  int todaysSolvedQuizs() {
    return allSolvedQuizs.length;
  }

  int todaysCorrectAnswers() {
    if (allSolvedQuizs.isEmpty) {
      return 0;
    }
    return allSolvedQuizs.map((e) => e.correctAnswers).reduce((a, b) => a + b);
  }

  int todaysWrongAnswers() {
    if (allSolvedQuizs.isEmpty) {
      return 0;
    }
    return allSolvedQuizs.map((e) => e.wrongAnswers).reduce((a, b) => a + b);
  }

  Future<void> getSolvedQuizs() async {
    allSolvedQuizs = await HiveService().getSolvedQuizList();
    allSolvedQuizsGet = true;
    notifyListeners();
  }
}
