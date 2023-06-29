import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:teacher_finder/common/api_config/api_config.dart';
class ProfileRecruiterRemoveDataProvider{
  String endpoint = 'api/v1/recruiters/{recruiterId}/profiles';
  Future<void>updateRecruiterProfile(int recruiterID, Map<String, dynamic> recruiterData)async{

    String url = endpoint.replaceAll('{recruiterId}', recruiterID.toString());

    final response = await http.put(
      Uri.parse('${ApiConfig.baseUrl}/$url'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(recruiterData),
    );
    if (response.statusCode == 200) {
      return;
    } else {
      throw Exception('Failed to load profile_recruiter');
    }

  }
}