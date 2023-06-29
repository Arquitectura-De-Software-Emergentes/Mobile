import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:teacher_finder/security/infrastucture/models/applicant/register_applicant_model.dart';

class RegisterApplicantRemoveDataProvider {
  String endpoint = 'http://teacher-finder.up.railway.app/api/v1/auth/applicants/register';
  //Enpoint GetProfileTeacherById

  Future<RegisterApplicantModel>postRegisterApplicant(RegisterApplicantModel registerApplicantModel) async {
    final response = await http.post(
      Uri.parse('${endpoint}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(registerApplicantModel.toJson()),
    );

    if (response.statusCode == 200) {
      return RegisterApplicantModel.toRegisterApplicant((response.body));
    } else {
      throw Exception('Failed to load register_applicant');
    }
  }

}