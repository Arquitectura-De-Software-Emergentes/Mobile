import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:teacher_finder/common/api_config/api_config.dart';

class ProfileRecruiterRemoteDataProvider {
  String endpoint = 'recruiters';
  Future<void> updateRecruiterProfile(
      int recruiterId,
      String name,
      String description,
      String urlWebPage,
      String phoneNumber,
      String image,
      String address) async {
//http://teacher-finder.up.railway.app/api/v1/recruiters/{recruiterId}/profiles?recruiterId=1&name=string&description=string&urlWebPage=string&phoneNumber=string&image=string&address=string
    var body = {
      "name": name,
      "description": description,
      "urlWebPage": urlWebPage,
      "phoneNumber": phoneNumber,
      "image": image,
      "address": address
    };
    final response = await http.put(
      Uri.parse(
          '${ApiConfig.baseUrl}/$endpoint/$recruiterId/profiles?recruiterId=$recruiterId&name=$name&description=$description&urlWebPage=$urlWebPage&phoneNumber=$phoneNumber&image=$image&address=$address'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(body),
    );
    if (response.statusCode == 200) {
      return;
    } else {
      throw Exception('Failed to load profile_recruiter');
    }
  }
}
