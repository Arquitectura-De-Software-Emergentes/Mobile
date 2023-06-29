import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/recuiter/register_recruiter_model.dart';

class RegisterRecruiterRemoveDataProvider{
  String endpoint= 'https://teacher-finder.up.railway.app/api/v1/auth/recruiters/register';
  //Enpoint GetProfileTeacherById

  Future<RegisterRecruiterModel> postRegisterRecruiter(RegisterRecruiterModel registerRecruiterModel) async {
    final response = await http.post(
      Uri.parse('${endpoint}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(registerRecruiterModel.toJson()),
    );

    if (response.statusCode == 200) {
      return RegisterRecruiterModel.toRegisterRecruiter(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load register_recruiter');
    }
  }
}