import 'dart:convert';

import '../../domain/entities/option.dart';

class OptionModel extends Option {
  OptionModel({
    required int id,
    required String response,
    required bool? isCorrect,
  }) : super(
          id: id,
          response: response,
          isCorrect: isCorrect,
        );

  factory OptionModel.fromJson(Map<String, dynamic> json) {
    return OptionModel(
      id: json['id'],
      response: json['response'],
      isCorrect: json['isCorrect'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'response': response,
      'isCorrect': isCorrect,
    };
  }

  static List<OptionModel> toOptionsList(String str) {
    return List<OptionModel>.from(
        jsonDecode(str).map((x) => OptionModel.fromJson(x)));
  }

  static String toOptionListJson(List<OptionModel> data) =>
      jsonEncode(List<dynamic>.from(data.map((x) => x.toJson())));

  static toOptionJson(OptionModel test) => jsonEncode(test);

  static OptionModel toOption(String str) =>
      OptionModel.fromJson(jsonDecode(str));
}
