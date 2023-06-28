import 'dart:convert';

import 'package:teacher_finder/assessment/domain/entities/question.dart';
import 'package:teacher_finder/assessment/infrastructure/models/test_model.dart';
import 'package:teacher_finder/common/api_config/api_config.dart';

import '../../domain/entities/test.dart';
import 'package:http/http.dart' as http;

class AssessmentRemoteDataProvider {
  String endpoint = 'assessments';

  Future<List<Test>> getAllTestsByRecruiterId(int recruiterId) async {
    try {
      final response = await http.get(Uri.parse(
          '${ApiConfig.baseUrl}/$endpoint/recruiter/$recruiterId/tests?recruiterId=$recruiterId'));
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

  Future<void> createQuestion(Question question, int testId) async {
    try {
      final headers = {'Content-Type': 'application/json'};
      final temp = {
        "statement": question.statement,
        "options": [
          {"response": question.options[0].response, "isCorrect": false},
          {"response": question.options[1].response, "isCorrect": false},
          {"response": question.options[2].response, "isCorrect": false},
          {"response": question.options[3].response, "isCorrect": true},
          {"response": question.options[4].response, "isCorrect": false}
        ],
        "points": 2
      };
      //'http://teacher-finder.up.railway.app/api/v1/assessments/tests/{testId}/questions?testId=1' \

      final response = await http.post(
        Uri.parse(
            '${ApiConfig.baseUrl}/$endpoint/tests/$testId/questions?testId=$testId'),
        headers: headers,
        body: jsonEncode(temp),
      );
      if (response.statusCode == 200) {
        print('success');
      } else {
        print(response.body);
        throw Exception(response.body);
      }
    } catch (error) {
      print('error:$error');
      throw Exception(error);
    }
  }

  Future<Test> getAllQuestionsByTestId(int testId) async {
    try {
      final response = await http.get(Uri.parse(
          '${ApiConfig.baseUrl}/$endpoint/tests/$testId?testId=$testId'));

      if (response.statusCode == 200) {
        final Test test = TestModel.toTest(response.body);
        return test;
      } else {
        print(response.body);
        throw Exception(response.body);
      }
    } catch (error) {
      print(error);
      throw Exception(error);
    }
  }

  Future<Map<String, dynamic>> getTestByOfferId(int offerId) async {
    try {
      //http://teacher-finder.up.railway.app/api/v1/assessments/1?jobOfferId=1
      final response = await http.get(Uri.parse(
          '${ApiConfig.baseUrl}/$endpoint/$offerId?jobOfferId=$offerId'));

      if (response.statusCode == 200) {
        final assessmentInfo = jsonDecode(response.body);
        return assessmentInfo;
      } else {
        print(response.body);
        throw Exception(response.body);
      }
    } catch (error) {
      print(error);
      throw Exception(error);
    }
  }

  Future<Map<String, dynamic>> submitTest(
      List<Question> questions, int jobOfferId, int applicantId) async {
//  'http://teacher-finder.up.railway.app/api/v1/assessments/{jobOfferId}/tests/applicant/{applicantId}/submit?jobOfferId=1&applicantId=1' \

    try {
      final headers = {'Content-Type': 'application/json'};
      List<Map<String, dynamic>> requestBody = questions.map((question) {
        return {
          "id": question.id,
          "statement": question.statement,
          "options": question.options.map((option) {
            return {
              "id": option.id,
              "response": option.response,
            };
          }).toList(),
          "responseId": question.responseId,
          "points": question.points,
        };
      }).toList();

      final response = await http.post(
        Uri.parse(
          '${ApiConfig.baseUrl}/$endpoint/$jobOfferId/tests/applicant/$applicantId/submit?jobOfferId=$jobOfferId&applicantId=$applicantId',
        ),
        headers: headers,
        body: json.encode(requestBody), // Convertir el cuerpo a JSON
      );
      print(response.body);
      return jsonDecode(response.body);
    } catch (error) {
      throw Exception(error);
    }
  }
}
