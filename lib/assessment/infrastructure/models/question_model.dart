import 'package:teacher_finder/assessment/domain/entities/option.dart';

import '../../domain/entities/question.dart';

class QuestionModel extends Question {
  QuestionModel({
    required int id,
    required String statement,
    required List<Option> options,
    required int points,
    required int responseId,
  }) : super(
            id: id,
            statement: statement,
            options: options,
            points: points,
            responseId: responseId);

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      id: json['id'],
      statement: json['statement'],
      options: json['options'], //TODO YARA
      points: json['points'],
      responseId: json['responseId'],
    );
  }
}
