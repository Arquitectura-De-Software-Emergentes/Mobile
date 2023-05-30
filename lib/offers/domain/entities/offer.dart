class Offer {
  int offerId;
  String title;
  String description;
  DateTime initialDate;
  DateTime endDate;
  double salary;
  int maxApplications;
  int numberApplications;

  Offer(
      {required this.offerId,
      required this.title,
      required this.description,
      required this.initialDate,
      required this.endDate,
      required this.salary,
      required this.maxApplications,
      required this.numberApplications});
}
