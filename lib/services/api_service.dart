import 'package:ehliyetim/models/quiz.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static String apiBaseUrl = 'https://ehliyet-api.herokuapp.com';

  Future<Quiz?> getQuiz({required int year, required int month, required int day}) async {
    final String url = '$apiBaseUrl/getQuestions?year=$year&month=$month&day=$day';
    final Uri apiUri = Uri.parse(url);
    final http.Response response = await http.get(apiUri);
    Map<String, dynamic> data = jsonDecode(response.body);

    if (data['status'] == 'error') {
      return null;
    }
    Quiz quiz = Quiz.fromJson(data);
    return quiz;
  }

  Future<String?> getTopic({required String topicKey, required int index}) async {
    final String url = '$apiBaseUrl/getTopics?topic=$topicKey&index=$index';
    final Uri apiUri = Uri.parse(url);
    final response = await http.get(apiUri);

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return null;
    }
  }

  Future<String> getHint() async {
    final String url = '$apiBaseUrl/getHint';
    final Uri apiUri = Uri.parse(url);
    final http.Response response = await http.get(apiUri);
    return response.body;
  }
}
