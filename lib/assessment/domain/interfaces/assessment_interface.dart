import '../entities/question.dart';
import '../entities/test.dart';

abstract class AssessmentInterface {
  Future<Test> createTest(Test test);
  Future<void> createQuestion(Question question, int testId);
  Future<List<Test>> getAllTestsByRecruiterId(int recruiterId);
  //LOCAL :P
  Future<Test> getAllQuestionsByTestId(int testId);
}
