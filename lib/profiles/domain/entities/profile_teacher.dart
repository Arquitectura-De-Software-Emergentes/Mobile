import 'academic_information_teacher.dart';
import 'contact_information_teacher.dart';
import 'job_experience_information_teacher.dart';
import 'personal_information_teacher.dart';

class ProfileTeacher  {
  final AcademicInformationTeacher academicInformation;
  final ContactInformationTeacher contactInformation;
  final PersonalInformationTeacher personalInformation;
  final List<JobExperienceInformationTeacher> jobExperienceInformations;
  ProfileTeacher(
      {required this.academicInformation,
      required this.contactInformation,
      required this.personalInformation,
      required this.jobExperienceInformations});
}