import 'dart:convert';
import 'package:teacher_finder/common/api_config/api_config.dart';
import 'package:teacher_finder/profiles/infrastucture/models/profile_teacher_model.dart';
import 'package:http/http.dart' as http;

class ProfileTeacherRemoveDataProvider {
  String endpoint = 'api/v1/applicants/{id}/profile';

  Future<ProfileTeacherModel> getProfileTeacherById(int id) async {
    String url = endpoint.replaceAll('{id}', id.toString());

    final response = await http.get(Uri.parse('${ApiConfig.baseUrl}/$url'));
    if (response.statusCode == 200) {
      return ProfileTeacherModel.toProfileTeacher(response.body);
    } else {
      throw Exception('Failed to load profile_teacher');
    }
  }
}
