import 'dart:convert';

import 'package:teacher_finder/assessment/domain/entities/question.dart';

import '../../domain/entities/test.dart';

class TestModel extends Test {
  TestModel({
    required int id,
    required String title,
    required int numQuestions,
    required int minScore,
  }) : super(
          id: id,
          title: title,
          numQuestions: numQuestions,
          minScore: minScore,
        );

  factory TestModel.fromJson(Map<String, dynamic> json) {
    return TestModel(
      id: json['id'],
      title: json['title'],
      minScore: json['minimunScore'],
      numQuestions: json['numQuestions'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'numQuestions': numQuestions,
      'minimunScore': minScore,
    };
  }

  static List<TestModel> toTestList(String str) {
    return List<TestModel>.from(
        jsonDecode(str).map((x) => TestModel.fromJson(x)));
  }

  static String toTestsListJson(List<TestModel> data) =>
      jsonEncode(List<dynamic>.from(data.map((x) => x.toJson())));

  static toTestJson(Test test) => jsonEncode(test);

  static Test toTest(String str) => TestModel.fromJson(jsonDecode(str));
}
