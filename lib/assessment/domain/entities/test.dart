import 'question.dart';

class Test {
  int id;
  String title;
  int? numQuestions;
  int? minScore;
  List<Question>? questions;

  Test(
      {required this.id,
      required this.title,
      this.numQuestions,
      this.minScore,
      this.questions});
}
