import 'dart:convert';
import 'package:ehliyetim/models/quiz_metadata.dart';

class SolvedQuiz {
  final QuizMetadata quizMetadata;
  final Duration duration;
  final int correctAnswers;
  final int wrongAnswers;
  final int totalQuestions;
  SolvedQuiz({
    required this.quizMetadata,
    required this.duration,
    required this.correctAnswers,
    required this.wrongAnswers,
    required this.totalQuestions,
  });

  SolvedQuiz copyWith({
    QuizMetadata? quizMetadata,
    Duration? duration,
    int? correctAnswers,
    int? wrongAnswers,
    int? totalQuestions,
  }) {
    return SolvedQuiz(
      quizMetadata: quizMetadata ?? this.quizMetadata,
      duration: duration ?? this.duration,
      correctAnswers: correctAnswers ?? this.correctAnswers,
      wrongAnswers: wrongAnswers ?? this.wrongAnswers,
      totalQuestions: totalQuestions ?? this.totalQuestions,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'quizMetadata': quizMetadata.toMap()});
    result.addAll({'duration': duration.inSeconds});
    result.addAll({'correctAnswers': correctAnswers});
    result.addAll({'wrongAnswers': wrongAnswers});
    result.addAll({'totalQuestions': totalQuestions});

    return result;
  }

  factory SolvedQuiz.fromMap(Map<dynamic, dynamic> map) {
    return SolvedQuiz(
      quizMetadata: QuizMetadata.fromMap(map['quizMetadata'] as Map),
      duration: Duration(seconds: map['duration']),
      correctAnswers: map['correctAnswers']?.toInt() ?? 0,
      wrongAnswers: map['wrongAnswers']?.toInt() ?? 0,
      totalQuestions: map['totalQuestions']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory SolvedQuiz.fromJson(String source) => SolvedQuiz.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SolvedQuiz(quizMetadata: $quizMetadata, duration: $duration, correctAnswers: $correctAnswers, wrongAnswers: $wrongAnswers, totalQuestions: $totalQuestions)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SolvedQuiz &&
        other.quizMetadata == quizMetadata &&
        other.duration == duration &&
        other.correctAnswers == correctAnswers &&
        other.wrongAnswers == wrongAnswers &&
        other.totalQuestions == totalQuestions;
  }

  @override
  int get hashCode {
    return quizMetadata.hashCode ^ duration.hashCode ^ correctAnswers.hashCode ^ wrongAnswers.hashCode ^ totalQuestions.hashCode;
  }
}
