import 'package:ehliyetim/models/solved_quiz.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  final String themeBox = 'appThemeBox';
  final String quizsBox = 'quizsBox';
  final String topicsBox = 'topicsBox';
  String todayKey = '${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}';

  Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox(themeBox);
    await Hive.openBox(quizsBox);
    await Hive.openBox(topicsBox);
  }

  Future<void> addSolvedQuiz(SolvedQuiz solvedQuiz) async {
    List<SolvedQuiz> solvedQuizList = getTodaysSolvedQuizList();
    solvedQuizList.add(solvedQuiz);
    await Hive.box(quizsBox).put(todayKey, solvedQuizList.map((e) => e.toMap()).toList());
  }

  List<SolvedQuiz> getTodaysSolvedQuizList() {
    List? quizs = Hive.box(quizsBox).get(todayKey);
    if (quizs == null) {
      return [];
    }
    return quizs.map((e) => SolvedQuiz.fromMap(e as Map)).toList();
  }

  List<SolvedQuiz> getAllSolvedQuizList() {
    List keys = Hive.box(quizsBox).keys.toList();
    List<SolvedQuiz> allQuizs = [];
    for (var element in keys) {
      List? quizs = Hive.box(quizsBox).get(element);
      if (quizs != null) {
        allQuizs.addAll(quizs.map((e) => SolvedQuiz.fromMap(e)).toList());
      }
    }
    return allQuizs;
  }

  List<String> getTopics() {
    List? topics = Hive.box(topicsBox).get(todayKey);
    if (topics == null) {
      return [];
    }
    return topics.map((e) => e as String).toList();
  }

  List<String> getAllTopics() {
    List keys = Hive.box(topicsBox).keys.toList();
    List<String> allTopics = [];
    for (var element in keys) {
      List? topics = Hive.box(topicsBox).get(element);
      if (topics != null) {
        allTopics.addAll(topics.map((e) => e as String).toList());
      }
    }
    return allTopics;
  }

  Future<void> addTopic(String topic) async {
    List<String> topics = getTopics();
    topics.add(topic);
    await Hive.box(topicsBox).put(todayKey, topics);
  }

  String? getTheme() {
    return Hive.box(themeBox).get('theme');
  }

  void setTheme(String theme) {
    Hive.box(themeBox).put('theme', theme);
  }

  Future<bool> isSubscribed() async {
    await Hive.openBox(themeBox);
    bool? isSubscribed = Hive.box(themeBox).get('isSubscribed');
    return isSubscribed ?? false;
  }

  Future<void> setSubscribed(bool isSubscribed) async {
    await Hive.openBox(themeBox);
    Hive.box(themeBox).put('isSubscribed', isSubscribed);
  }
}
