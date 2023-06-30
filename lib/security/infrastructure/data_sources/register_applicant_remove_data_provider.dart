import 'dart:convert';
import 'package:http/http.dart' as http;

class RegisterApplicantRemoveDataProvider {
  String endpoint =
      'https://teacher-finder.up.railway.app/api/v1/auth/applicants/register';

  Future<void> postRegisterApplicant(String username, String password) async {
    final objeto = {
      'username': username,
      'password': password,
      'role': "APPLICANT",
    };

    final response = await http.post(
      Uri.parse(endpoint),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(objeto),
    );

    if (response.statusCode == 200) {
      return;
    } else {
      throw Exception('Failed to load register_applicant');
    }
  }
}
