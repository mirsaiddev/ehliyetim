import 'package:ehliyetim/models/quiz.dart';
import 'package:flutter/material.dart';

import 'api_service.dart';

class ApiFetch extends StatefulWidget {
  const ApiFetch({Key? key}) : super(key: key);

  @override
  State<ApiFetch> createState() => _ApiFetchState();
}

class _ApiFetchState extends State<ApiFetch> {
  late Future<Quiz> quiz;
  late ApiService service;
  @override
  void initState() {
    super.initState();
    service = ApiService();
    // quiz = service.getQuiz(year: 2020, month: 2, day: 5);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: FutureBuilder<Quiz>(builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data!.quizName);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const CircularProgressIndicator();
          }),
        ));
  }
}
