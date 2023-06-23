import 'package:teacher_finder/assessment/domain/entities/question.dart';

import '../../domain/entities/test.dart';

class TestModel extends Test {
  TestModel({
    required int id,
    required int minScore,
    required int numQuestions,
    required List<Question> questions,
  }) : super(
          id: id,
          minScore: minScore,
          numQuestions: numQuestions,
          questions: questions,
        );
}
