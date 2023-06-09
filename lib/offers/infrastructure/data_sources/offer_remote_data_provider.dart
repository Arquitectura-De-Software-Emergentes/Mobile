import 'dart:convert';

import 'package:teacher_finder/common/api_config/api_config.dart';
import 'package:http/http.dart' as http;
import '../models/offer_model.dart';

class OfferRemoteDataProvider {
  //String endpoint = 'job-offers';
  String endpoint = 'offers1';
  Future<List<OfferModel>> getAllOffers() async {
    final response =
        await http.get(Uri.parse("${ApiConfig.baseUrl}/$endpoint"));
    print(jsonDecode(response.body));
    if (response.statusCode == 200) {
      final List<OfferModel> listOffers = OfferModel.toOfferList(response.body);
      print('entre');

      return listOffers;
    } else {
      throw Exception('Failed to fetch offers');
    }
  }
}
