import 'package:teacher_finder/assessment/domain/entities/question.dart';
import 'package:teacher_finder/assessment/domain/entities/test.dart';
import 'package:teacher_finder/assessment/domain/interfaces/assessment_interface.dart';
import 'package:teacher_finder/assessment/infrastructure/data_sources/assessment_remote_data_provider.dart';

class AssessmentRepository extends AssessmentInterface {
  AssessmentRepository({required this.assessmentRemoteDataProvider});
  final AssessmentRemoteDataProvider assessmentRemoteDataProvider;

  @override
  Future<List<Test>> getAllTestsByRecruiterId(int recruiterId) {
    final response =
        assessmentRemoteDataProvider.getAllTestsByRecruiterId(recruiterId);
    return response;
  }

  @override
  Future<Test> createTest(Test test) async {
    final response = await assessmentRemoteDataProvider.createTest(test);
    return response;
  }

  @override
  Future<List<Question>> getAllQuestionsByTestId(int testId) {
    // TODO: implement getAllQuestionsByTestId
    throw UnimplementedError();
  }

  @override
  Future<Test> createQuestion(Question question) {
    // TODO: implement createQuestion
    throw UnimplementedError();
  }
}
