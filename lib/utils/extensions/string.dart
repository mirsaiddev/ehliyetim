import 'package:ehliyetim/utils/constants/answer.dart';

extension StringExtensions on String {
  int toAnswerIndex() {
    return answerToIndex[this] ?? 0;
  }
}
