import 'question.dart';

class Test {
  int id;
  int minScore;
  int numQuestions;
  List<Question> questions;

  Test({
    required this.id,
    required this.minScore,
    required this.numQuestions,
    required this.questions,
  });
}
