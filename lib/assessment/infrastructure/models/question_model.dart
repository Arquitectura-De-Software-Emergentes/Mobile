import 'dart:convert';

import 'package:teacher_finder/assessment/domain/entities/option.dart';
import 'package:teacher_finder/assessment/infrastructure/models/option_model.dart';

import '../../domain/entities/question.dart';

class QuestionModel extends Question {
  QuestionModel({
    required int id,
    required String statement,
    required List<Option> options,
    required int? points,
    required int? responseId,
  }) : super(
          id: id,
          statement: statement,
          options: options,
          points: points,
          responseId: responseId,
        );

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      id: json['id'],
      statement: json['statement'],
      options: json["options"] == null
          ? []
          : List<Option>.from(
              json["options"]!.map((x) => OptionModel.fromJson(x))),
      points: json['points'],
      responseId: json['responseId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'statement': statement,
      'options': options,
      'points': points,
      'responseId': responseId,
    };
  }

  static List<QuestionModel> toQuestionList(String str) {
    return List<QuestionModel>.from(
        jsonDecode(str).map((x) => QuestionModel.fromJson(x)));
  }

  static String toQuestionsListJson(List<QuestionModel> data) =>
      jsonEncode(List<dynamic>.from(data.map((x) => x.toJson())));

  static toQuestionJson(Question test) => jsonEncode(test);

  static Question toQuestion(String str) =>
      QuestionModel.fromJson(jsonDecode(str));
}
