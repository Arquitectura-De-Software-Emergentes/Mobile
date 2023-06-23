import '../entities/question.dart';
import '../entities/test.dart';

abstract class AssessmentInterface {
  Future<Test> createTest(Test test);
  Future<Test> createQuestion(Question question);
  Future<List<Test>> getAllTestsByRecruiterId(int recruiterId);
  //LOCAL :P
  Future<List<Question>> getAllQuestionsByTestId(int testId);
}
