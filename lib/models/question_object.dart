import 'dart:convert';

import 'package:flutter/foundation.dart';

class QuestionObject {
  final int questionCount;
  final List<String> contents;
  final int questionBodyIndexIncontents;
  final List<String> answers;
  final String correctAnswer;
  QuestionObject({
    required this.questionCount,
    required this.contents,
    required this.questionBodyIndexIncontents,
    required this.answers,
    required this.correctAnswer,
  });

  QuestionObject copyWith({
    int? questionCount,
    List<String>? contents,
    int? questionBodyIndexIncontents,
    List<String>? answers,
    String? correctAnswer,
  }) {
    return QuestionObject(
      questionCount: questionCount ?? this.questionCount,
      contents: contents ?? this.contents,
      questionBodyIndexIncontents: questionBodyIndexIncontents ?? this.questionBodyIndexIncontents,
      answers: answers ?? this.answers,
      correctAnswer: correctAnswer ?? this.correctAnswer,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'questionCount': questionCount});
    result.addAll({'contents': contents});
    result.addAll({'questionBodyIndexIncontents': questionBodyIndexIncontents});
    result.addAll({'answers': answers});
    result.addAll({'correctAnswer': correctAnswer});

    return result;
  }

  factory QuestionObject.fromMap(Map<String, dynamic> map) {
    return QuestionObject(
      questionCount: int.parse((map['questionCount'] as String).replaceAll('Soru ', '').replaceAll('.', '')),
      contents: List<String>.from(map['contents']),
      questionBodyIndexIncontents: map['questionBodyIndexIncontents']?.toInt() ?? 0,
      answers: List<String>.from(map['answers']),
      correctAnswer: map['correctAnswer'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory QuestionObject.fromJson(String source) => QuestionObject.fromMap(json.decode(source));

  @override
  String toString() {
    return 'QuestionObject(questionCount: $questionCount, contents: $contents, questionBodyIndexIncontents: $questionBodyIndexIncontents, answers: $answers, correctAnswer: $correctAnswer)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is QuestionObject &&
        other.questionCount == questionCount &&
        listEquals(other.contents, contents) &&
        other.questionBodyIndexIncontents == questionBodyIndexIncontents &&
        listEquals(other.answers, answers) &&
        other.correctAnswer == correctAnswer;
  }

  @override
  int get hashCode {
    return questionCount.hashCode ^ contents.hashCode ^ questionBodyIndexIncontents.hashCode ^ answers.hashCode ^ correctAnswer.hashCode;
  }
}
