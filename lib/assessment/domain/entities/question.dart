import 'dart:convert';

import 'package:teacher_finder/assessment/infrastructure/models/question_model.dart';

import 'option.dart';

class Question {
  int id;
  String statement;
  List<Option> options;
  int? responseId;
  int? points;
  Question({
    required this.id,
    required this.statement,
    required this.options,
    required this.responseId,
    required this.points,
  });
}
