import 'dart:convert';

class Offer {
  String offerId;
  String title;
  String description;
  DateTime initialDate;
  DateTime endDate;
  String salary;
  int maxApplications;
  int numberApplications;

  Offer({
    required this.offerId,
    required this.title,
    required this.description,
    required this.initialDate,
    required this.endDate,
    required this.salary,
    required this.maxApplications,
    required this.numberApplications,
  });

  factory Offer.fromJson(Map<String, dynamic> json) {
    return Offer(
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

  static List<Offer> toOfferList(String str) {
    return List<Offer>.from(json.decode(str).map((x) => Offer.fromJson(x)));
  }
  String offerToJson(List<Offer> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
  Offer toOffer(String str) => Offer.fromJson(jsonDecode(str));


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
}