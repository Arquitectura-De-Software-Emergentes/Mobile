import 'dart:convert';

class AppliedOfferModel {
  int jobOfferId;
  String title;
  String description;

  AppliedOfferModel(
      {required this.jobOfferId,
      required this.title,
      required this.description});

  factory AppliedOfferModel.fromJson(Map<String, dynamic> json) {
    return AppliedOfferModel(
      jobOfferId: json['jobOfferId'],
      title: json['title'],
      description: json['description'],
    );
  }

  static List<AppliedOfferModel> toAppliedOfferList(String str) {
    return List<AppliedOfferModel>.from(
        jsonDecode(str).map((x) => AppliedOfferModel.fromJson(x)));
  }
}
