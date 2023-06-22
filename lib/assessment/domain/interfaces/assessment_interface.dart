import '../entities/test.dart';

abstract class AssessmentInterface {
  Future<Test> createTest(Test test);
}
