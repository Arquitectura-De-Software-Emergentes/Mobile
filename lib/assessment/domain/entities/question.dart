import 'option.dart';

class Question {
  int id;
  int testId;
  String statement;
  List<Option> options;
  int points;
  Question({
    required this.id,
    required this.testId,
    required this.statement,
    required this.options,
    required this.points,
  });
}
