import 'dart:convert';

import 'package:ehliyetim/models/quiz.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiService {
  static String apiBaseUrl = 'https://ehliyet-api.herokuapp.com';

  Future<Quiz> getQuiz({required int year, required int month, required int day}) async {
    // return Quiz
    List<Quiz> quiz = [];
    final String url = '$apiBaseUrl/getQuestions?year=$year&month=$month&day=$day';
    debugPrint('getQuiz url: $url');
    final Uri apiUri = Uri.parse(url);

    Response response = await http.get(apiUri);

    if (response.statusCode == 200) {
      return Quiz.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load Quiz');
    }
    /* Map<String, dynamic> jsonData = jsonDecode(response.body);

    jsonData["photos"].forEach((element) {
      Quiz QuizModel = Quiz.fromMap(element);
      quiz.add(QuizModel);
    });
    return null;*/
  }
}
