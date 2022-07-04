import 'dart:convert';

class QuizMetadata {
  final int year;
  final int month;
  final int day;
  QuizMetadata({
    required this.year,
    required this.month,
    required this.day,
  });

  QuizMetadata copyWith({
    int? year,
    int? month,
    int? day,
  }) {
    return QuizMetadata(
      year: year ?? this.year,
      month: month ?? this.month,
      day: day ?? this.day,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'year': year});
    result.addAll({'month': month});
    result.addAll({'day': day});

    return result;
  }

  factory QuizMetadata.fromMap(Map<dynamic, dynamic> map) {
    return QuizMetadata(
      year: map['year']?.toInt() ?? 0,
      month: map['month']?.toInt() ?? 0,
      day: map['day']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory QuizMetadata.fromJson(String source) => QuizMetadata.fromMap(json.decode(source));

  @override
  String toString() => 'QuizMetadata(year: $year, month: $month, day: $day)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is QuizMetadata && other.year == year && other.month == month && other.day == day;
  }

  @override
  int get hashCode => year.hashCode ^ month.hashCode ^ day.hashCode;
}
