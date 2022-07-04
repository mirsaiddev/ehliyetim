import 'package:ehliyetim/models/solved_quiz.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  final String themeBox = 'appThemeBox';
  final String quizsBox = 'quizsBox';
  String todayKey = '${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}';

  Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox(themeBox);
    await Hive.openBox(quizsBox);
  }

  Future<void> addSolvedQuiz(SolvedQuiz solvedQuiz) async {
    List<SolvedQuiz> solvedQuizList = await getSolvedQuizList();
    solvedQuizList.add(solvedQuiz);
    await Hive.box(quizsBox).put(todayKey, solvedQuizList.map((e) => e.toMap()).toList());
  }

  List<SolvedQuiz> getSolvedQuizList() {
    List? quizs = Hive.box(quizsBox).get(todayKey);
    if (quizs == null) {
      return [];
    }
    return quizs.map((e) => SolvedQuiz.fromMap(e as Map)).toList();
  }

  String? getTheme() {
    return Hive.box(themeBox).get('theme');
  }

  void setTheme(String theme) {
    Hive.box(themeBox).put('theme', theme);
  }
}
