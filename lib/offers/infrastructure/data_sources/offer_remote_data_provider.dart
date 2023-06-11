import 'dart:convert';

import 'package:teacher_finder/common/api_config/api_config.dart';
import 'package:http/http.dart' as http;
import '../../domain/entities/offer.dart';
import '../models/offer_model.dart';

class OfferRemoteDataProvider {
  String endpoint = 'job-offers';
  //String endpoint = 'offers';
  Future<List<OfferModel>> getAllOffers() async {
    try {
      final response =
          await http.get(Uri.parse("${ApiConfig.baseUrl}/$endpoint"));
      if (response.statusCode == 200) {
        final List<OfferModel> listOffers =
            OfferModel.toOfferList(response.body);

        return listOffers;
      } else {
        throw Exception(response.body);
      }
    } catch (error) {
      throw Exception('Failed to fetch offers: $error');
    }
  }

  Future<Offer> createOffer(Offer body) async {
    try {
      final temp = {
        "recruiterId": 1,
        "title": "string",
        "description": "string",
        "initialDate": "2023-06-10T07:22:41.854Z",
        "endDate": "2023-06-10T07:22:41.854Z",
        "salary": {"mount": 0, "currency": "PEN"},
        "maxApplications": 0,
        "numberApplications": 0,
        "availability": "AVAILABLE"
      };
      final response = await http.post(
          Uri.parse("${ApiConfig.baseUrl}/$endpoint"),
          body: jsonEncode(temp));
      print('hata aca llegue');
      if (response.statusCode == 200) {
        return OfferModel.toOffer(response.body);
      } else {
        throw Exception(response.body);
      }
    } catch (error) {
      throw Exception('Failed to create offer: $error');
    }
  }
}
