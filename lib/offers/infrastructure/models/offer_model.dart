import 'dart:convert';

import 'package:teacher_finder/offers/domain/entities/enums/availability.dart';
import 'package:teacher_finder/offers/domain/entities/offer.dart';
import 'package:teacher_finder/offers/domain/entities/position_profile.dart';
import 'package:teacher_finder/offers/domain/entities/salary.dart';
import 'package:teacher_finder/offers/infrastructure/models/position_profile.dart';
import 'package:teacher_finder/offers/infrastructure/models/salary_model.dart';

class OfferModel extends Offer {
  OfferModel(
      {required int id,
      required int recruiterId,
      required String title,
      required String description,
      required DateTime initialDate,
      required DateTime endDate,
      required Salary salary,
      required int maxApplications,
      required int numberApplications,
      required Availability availability,
      required PositionProfile positionProfile})
      : super(
            id: id,
            recruiterId: recruiterId,
            title: title,
            description: description,
            initialDate: initialDate,
            endDate: endDate,
            salary: salary,
            maxApplications: maxApplications,
            numberApplications: numberApplications,
            availability: availability,
            positionProfile: positionProfile);

  factory OfferModel.fromJson(Map<String, dynamic> json) {
    return OfferModel(
        id: json['id'],
        recruiterId: json['recruiterId'],
        title: json['title'],
        description: json['description'],
        initialDate: DateTime.parse(json['initialDate']),
        endDate: DateTime.parse(json['endDate']),
        salary: SalaryModel.fromJson(json['salary']),
        maxApplications: json['maxApplications'] ?? 0,
        numberApplications: json['numberApplications'],
        availability: Availability.parseAvailability(json['availability']),
        positionProfile:
            PositionProfileModel.fromJson(json['positionProfile']));
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'recruiterId': recruiterId,
      'title': title,
      'description': description,
      'initialDate': initialDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'salary': salary,
      'maxApplications': maxApplications,
      'numberApplications': numberApplications,
      'availability': availability,
      'positionProfile': positionProfile
    };
  }

  static List<OfferModel> toOfferList(String str) {
    return List<OfferModel>.from(
        json.decode(str).map((x) => OfferModel.fromJson(x)));
  }

  String offerToJson(List<OfferModel> data) =>
      json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
  Offer toOffer(String str) => OfferModel.fromJson(jsonDecode(str));
}
