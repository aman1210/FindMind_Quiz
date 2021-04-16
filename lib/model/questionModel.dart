import 'package:flutter/foundation.dart';

class QuestionModel {
  final String question;
  final List<String> options;
  final String correct;

  QuestionModel({
    @required this.question,
    @required this.options,
    @required this.correct,
  });
}
