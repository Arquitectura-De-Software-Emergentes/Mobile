import 'enums/availability.dart';
import 'position_profile.dart';
import 'salary.dart';

class Offer {
  final int id;
  final int recruiterId;
  final String title;
  final String description;
  final DateTime initialDate;
  final DateTime endDate;
  final Salary salary;
  final int maxApplications;
  final int numberApplications;
  final Availability availability;
  final PositionProfile positionProfile;

  Offer({
    required this.id,
    required this.recruiterId,
    required this.title,
    required this.description,
    required this.initialDate,
    required this.endDate,
    required this.salary,
    required this.maxApplications,
    required this.numberApplications,
    required this.availability,
    required this.positionProfile,
  });
}
