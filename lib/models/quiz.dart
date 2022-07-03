import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:ehliyetim/models/question_object.dart';

class Quiz {
  final String quizName;
  final List<QuestionObject> questionObjects;
  Quiz({
    required this.quizName,
    required this.questionObjects,
  });

  Quiz copyWith({
    String? quizName,
    List<QuestionObject>? questionObjects,
  }) {
    return Quiz(
      quizName: quizName ?? this.quizName,
      questionObjects: questionObjects ?? this.questionObjects,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'quizName': quizName});
    result.addAll({'questionObjects': questionObjects.map((x) => x.toMap()).toList()});

    return result;
  }

  factory Quiz.fromMap(Map<String, dynamic> map) {
    return Quiz(
      quizName: map['quizName'] ?? '',
      questionObjects: List<QuestionObject>.from(map['questionObjects']?.map((x) => QuestionObject.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  //factory Quiz.fromJson(String source) => Quiz.fromMap(json.decode(source));

  factory Quiz.fromJson(Map<String, dynamic> json) => Quiz(
        quizName: json["quizName"],
        questionObjects: List<QuestionObject>.from(json["questionObjects"].map((x) => QuestionObject.fromMap(x)).toList()),
      );

  @override
  String toString() => 'Quiz(quizName: $quizName, questionObjects: $questionObjects)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Quiz && other.quizName == quizName && listEquals(other.questionObjects, questionObjects);
  }

  @override
  int get hashCode => quizName.hashCode ^ questionObjects.hashCode;
}
