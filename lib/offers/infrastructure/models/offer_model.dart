import 'dart:convert';

import 'package:teacher_finder/offers/domain/entities/offer.dart';

class OfferModel extends Offer{
  OfferModel({
    required String offerId,
    required String title,
    required String description,
    required DateTime initialDate,
    required DateTime endDate,
    required String salary,
    required int maxApplications,
    required int numberApplications,
  }) : super(offerId: offerId,
      title: title,
      description: description,
      initialDate: initialDate,
      endDate: endDate,
      salary:salary,
      maxApplications: maxApplications,
      numberApplications: numberApplications);



  factory OfferModel.fromJson(Map<String, dynamic> json) {
    return OfferModel(
      offerId: json['offerId'],
      title: json['title'],
      description: json['description'],
      initialDate: DateTime.parse(json['initialDate']),
      endDate: DateTime.parse(json['endDate']),
      salary: json['salary'],
      maxApplications: json['maxApplications'],
      numberApplications: json['numberApplications'],
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'offerId': offerId,
      'title': title,
      'description': description,
      'initialDate': initialDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'salary': salary,
      'maxApplications': maxApplications,
      'numberApplications': numberApplications,
    };
  }
  static List<OfferModel> toOfferList(String str) {
    return List<OfferModel>.from(json.decode(str).map((x) => OfferModel.fromJson(x)));
  }
  String offerToJson(List<OfferModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
  Offer toOffer(String str) => OfferModel.fromJson(jsonDecode(str));
}



