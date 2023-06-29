import 'dart:convert';

import 'package:teacher_finder/common/api_config/api_config.dart';
import 'package:http/http.dart' as http;
import 'package:teacher_finder/offers/infrastructure/models/applied_offer_model.dart';

import '../../domain/entities/offer.dart';
import '../models/offer_model.dart';

class OfferRemoteDataProvider {
  String endpoint = 'job-offers';

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

  Future<List<OfferModel>> getAllOffersByRecruiterId(int id) async {
    try {
      final response = await http
          .get(Uri.parse("${ApiConfig.baseUrl}/$endpoint/recruiter/$id"));
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

  Future<List<AppliedOfferModel>> getAllAppliedOffersByApplicantId(
      String id) async {
    try {
      String url = "${ApiConfig.baseUrl}/applications/applicants/6";
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final List<AppliedOfferModel> listOffers =
            AppliedOfferModel.toAppliedOfferList(response.body);
        return listOffers;
      } else {
        throw Exception(response.body);
      }
    } catch (error) {
      throw Exception('Failed to fetch offers: $error');
    }
  }

  Future<Offer> createOffer(Offer offer) async {
    try {
      final temp = {
        "recruiterId": 2,
        "title": offer.title,
        "description": offer.description,
        "initialDate": offer.initialDate?.toIso8601String(),
        "endDate": offer.endDate.toIso8601String(),
        "salary": {
          "mount": offer.salary.mount,
          "currency": offer.salary.currency.value
        },
        "maxApplications": offer.maxApplications,
        "numberApplications": offer.numberApplications,
        "availability": offer.availability.value
      };

      // OfferModel.toOfferJson(offer);
      final headers = {'Content-Type': 'application/json'};

      final response = await http.post(
          Uri.parse("${ApiConfig.baseUrl}/$endpoint"),
          body: jsonEncode(temp),
          headers: headers);
      if (response.statusCode == 200) {
        return OfferModel.toOffer(response.body);
      } else {
        throw Exception(response.body);
      }
    } catch (error) {
      throw Exception('$error');
    }
  }
}
