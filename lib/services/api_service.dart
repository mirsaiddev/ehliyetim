import 'package:ehliyetim/models/quiz.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static String apiBaseUrl = 'https://ehliyet-api.herokuapp.com';

  Future<Quiz?> getQuiz({required int year, required int month, required int day}) async {
    final String url = '$apiBaseUrl/getQuestions?year=$year&month=$month&day=$day';
    final Uri apiUri = Uri.parse(url);
    final http.Response response = await http.get(apiUri);
    Map<String, dynamic> data = jsonDecode(response.body);

    print(data);
    if (data['status'] == 'error') {
      return null;
    }
    Quiz quiz = Quiz.fromJson(data);
    return quiz;
  }
  // await ApiService().getTopic(topicKey: widget.topicKey, index: widget.index);

  Future<String?> getTopic({required String topicKey, required int index}) async {
    final String url = '$apiBaseUrl/getTopics?topic=$topicKey&index=$index';
    debugPrint('getTopic url: $url');
    final Uri apiUri = Uri.parse(url);
    final response = await http.get(apiUri);

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return null;
    }
  }
}

/**Future<Map<String, dynamic>> getQuiz(
      {required int year, required int month, required int day}) async {
    // return Quiz
    List<Quiz> quiz = [];
    final String url = '$apiBaseUrl/getQuestions?year=$year&month=$month&day=$day';
    debugPrint('getQuiz url: $url');
    final Uri apiUri = Uri.parse(url);

    http.Response response = await http.get(
      Uri.parse(url),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> map = json.decode(response.body);
      return map;
    } else {
      throw Exception('Failed to load Quiz');
    }
    /* Map<String, dynamic> jsonData = jsonDecode(response.body);

    jsonData["photos"].forEach((element) {
      Quiz QuizModel = Quiz.fromMap(element);
      quiz.add(QuizModel);
    });
    return null;*/
  } */