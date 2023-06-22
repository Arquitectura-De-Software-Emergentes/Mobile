import 'package:teacher_finder/assessment/domain/entities/test.dart';
import 'package:teacher_finder/assessment/domain/interfaces/assessment_interface.dart';
import 'package:teacher_finder/assessment/infrastructure/data_sources/assessment_remote_data_provider.dart';

class AssessmentRepository extends AssessmentInterface {
  AssessmentRepository({required this.assessmentRemoteDataProvider});
  final AssessmentRemoteDataProvider assessmentRemoteDataProvider;
  @override
  Future<Test> createTest(Test test) async {
    final response = await assessmentRemoteDataProvider.createTest(test);
    return response;
  }
}
