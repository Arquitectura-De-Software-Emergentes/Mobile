import 'package:teacher_finder/assessment/domain/entities/option.dart';

import '../../domain/entities/question.dart';

class QuestionModel extends Question {
  QuestionModel({
    required int id,
    required int testId,
    required String statement,
    required List<Option> options,
    required int points,
  }) : super(
          id: id,
          testId: testId,
          statement: statement,
          options: options,
          points: points,
        );
}
