import 'dart:convert';

import 'package:teacher_finder/assessment/domain/entities/question.dart';
import 'package:teacher_finder/assessment/infrastructure/models/question_model.dart';

import '../../domain/entities/test.dart';

class TestModel extends Test {
  TestModel({
    required int id,
    required String title,
    required int? numQuestions,
    required int? minScore,
    required List<Question>? questions,
  }) : super(
          id: id,
          title: title,
          numQuestions: numQuestions,
          minScore: minScore,
          questions: questions,
        );

  factory TestModel.fromJson(Map<String, dynamic> json) {
    return TestModel(
      id: json['id'],
      title: json['title'],
      minScore: json['minimunScore'],
      numQuestions: json['numQuestions'],
      questions: json["questions"] == null
          ? []
          : List<Question>.from(
              json["questions"]!.map((x) => QuestionModel.fromJson(x))),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'numQuestions': numQuestions,
      'minimunScore': minScore,
      'questions': questions,
    };
  }

  static List<TestModel> toTestList(String str) {
    return List<TestModel>.from(
        jsonDecode(str).map((x) => TestModel.fromJson(x)));
  }

  static String toTestsListJson(List<TestModel> data) =>
      jsonEncode(List<dynamic>.from(data.map((x) => x.toJson())));

  static toTestJson(Test test) => jsonEncode(test);

  static Test toTest(String str) {
    Map<String, dynamic> json = jsonDecode(str);
    print(TestModel.fromJson(json));
    return TestModel.fromJson(json);
  }
}
