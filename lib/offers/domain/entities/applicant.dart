import 'enums/availability.dart';
import 'position_profile.dart';
import 'salary.dart';

class Applicant {
  final String applicantProfile;

  Applicant({
    required this.applicantProfile,
  });
}

class ApplicantProfile {
  final int applicantProfileId;
  final AcademicInformation academicInformation;
  final PersonalInformation applicantInformation;

  ApplicantProfile(
      {required this.applicantProfileId,
      required this.academicInformation,
      required this.applicantInformation});
}

class AcademicInformation {
  final String school;
  final String specialty;
  final String reference;

  AcademicInformation(
      {required this.school, required this.specialty, required this.reference});
}

class PersonalInformation {
  final String name;
  final String lastname;

  PersonalInformation({required this.name, required this.lastname});
}
