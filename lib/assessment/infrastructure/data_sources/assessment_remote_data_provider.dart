import 'dart:convert';

import 'package:teacher_finder/assessment/infrastructure/models/test_model.dart';
import 'package:teacher_finder/common/api_config/api_config.dart';

import '../../domain/entities/test.dart';
import 'package:http/http.dart' as http;

class AssessmentRemoteDataProvider {
  String endpoint = 'assessments';

  Future<List<Test>> getAllTestsByRecruiterId(int recruiterId) async {
    try {
      //  'http://teacher-finder.up.railway.app/api/v1/assessments/recuiter/{recuiterId}/tests?recuiterId=1' \

      final response = await http.get(Uri.parse(
          '${ApiConfig.baseUrl}/$endpoint/recuiter/$recruiterId/tests?recuiterId=$recruiterId'));
      if (response.statusCode == 200) {
        final List<TestModel> tests = TestModel.toTestList(response.body);
        return tests;
      } else {
        print(response.body);
        throw Exception(response.body);
      }
    } catch (error) {
      throw Exception('error: $error');
    }
  }

  Future<Test> createTest(Test test) async {
    try {
      final headers = {'Content-Type': 'application/json'};
      final temp = {
        "recruiterId": 1,
        "title": test.title,
        "minimunScore": test.minScore,
        "numQuestions": test.numQuestions
      };
      final response = await http.post(
        Uri.parse('${ApiConfig.baseUrl}/$endpoint/tests'),
        headers: headers,
        body: jsonEncode(temp),
      );
      if (response.statusCode == 200) {
        final Test test = TestModel.toTest(response.body);
        return test;
      } else {
        print(response.body);
        throw Exception(response.body);
      }
    } catch (error) {
      print('error:$error');
      throw Exception(error);
    }
  }
}
