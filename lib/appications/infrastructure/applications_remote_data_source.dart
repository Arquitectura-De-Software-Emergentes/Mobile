import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../common/api_config/api_config.dart';

class ApplicationsRemoteDateSource {
  String endpoint = 'applications';

  Future<String> applyJobOffer(int jobOfferId, int applicantId) async {
    try {
      final response = await http.post(Uri.parse(
          '${ApiConfig.baseUrl}/$endpoint/apply/job-offers/$jobOfferId/aplicants/$applicantId'));
      print(response.body);
      if (response.statusCode == 422) {
        return 'already applied';
      } else {
        return 'successful application';
      }
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<List<dynamic>> getAllApplicationsByOfferId(int offerId) async {
    try {
      final response = await http
          .get(Uri.parse('${ApiConfig.baseUrl}/$endpoint/job-offers/$offerId'));
      final List<dynamic> jsonData = jsonDecode(response.body) as List<dynamic>;
      return jsonData;
    } catch (error) {
      throw Exception(error);
    }
  }
}
