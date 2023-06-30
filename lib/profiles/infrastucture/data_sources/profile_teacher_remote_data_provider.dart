import 'dart:convert';

import 'package:teacher_finder/common/api_config/api_config.dart';
import 'package:http/http.dart' as http;

import '../../../common/user_config/user_config.dart';

class ProfileTeacherRemoteDataProvider {
  String endpoint = 'applicants';
//Enpoint GetProfileTeacherById
  Future<Map<String, dynamic>> getProfileTeacherById() async {
    try {
      int applicantId = await UserConfig.getUserId();
      print('entree: ${applicantId}');
      final response = await http.get(
          Uri.parse('${ApiConfig.baseUrl}/$endpoint/$applicantId/profile'));
      print(response.body);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception(response.body);
      }
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<void> editProfile(Map<String, dynamic> obj) async {
    try {
      final headers = {'Content-Type': 'application/json'};
      int applicantId = await UserConfig.getUserId();
      await http.put(
          Uri.parse('${ApiConfig.baseUrl}/$endpoint/$applicantId/profile'),
          headers: headers,
          body: jsonEncode(obj));
    } catch (error) {
      throw Exception(error);
    }
  }
}
