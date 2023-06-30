import 'package:http/http.dart' as http;

import '../../common/api_config/api_config.dart';

class ApplicationsRemoteDateSource {
  String endpoint = 'applications';

  Future<void> applyJobOffer(int jobOfferId, int applicantId) async {
    //http://teacher-finder.up.railway.app/api/v1/applications/apply/job-offers/1/aplicants/1

    try {
      final response = await http.post(Uri.parse(
          '${ApiConfig.baseUrl}/$endpoint/apply/job-offers/$jobOfferId/aplicants/6'));
      print(response.body);
    } catch (error) {
      throw Exception(error);
    }
  }
}
