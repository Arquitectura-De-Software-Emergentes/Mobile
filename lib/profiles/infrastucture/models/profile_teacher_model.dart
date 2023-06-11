import 'package:teacher_finder/profiles/infrastucture/models/academic_information_teacher_model.dart';
import 'package:teacher_finder/profiles/infrastucture/models/contact_information_teacher_model.dart';
import 'package:teacher_finder/profiles/infrastucture/models/job_experience_information_teacher_model.dart';
import 'package:teacher_finder/profiles/infrastucture/models/personal_information_teacher_model.dart';
import 'dart:convert';

import '../../domain/entities/profile_teacher.dart';

class ProfileTeacherModel extends ProfileTeacher {
  ProfileTeacherModel({
    required AcademicInformationTeacherModel academicInformation,
    required ContactInformationTeacherModel contactInformation,
    required PersonalInformationTeacherModel personalInformation,
    required List<JobExperienceInformationTeacherModel> jobExperienceInformations,
  }) : super(
    academicInformation: academicInformation,
    contactInformation: contactInformation,
    personalInformation: personalInformation,
    jobExperienceInformations: jobExperienceInformations,
  );

  factory ProfileTeacherModel.fromJson(Map<String, dynamic> json) {
    return ProfileTeacherModel(
      academicInformation: AcademicInformationTeacherModel.fromJson(json['academicInformation']),
      contactInformation: ContactInformationTeacherModel.fromJson(json['contactInformation']),
      personalInformation: PersonalInformationTeacherModel.fromJson(json['personalInformation']),
      jobExperienceInformations: List<JobExperienceInformationTeacherModel>.from(
        json['jobExperienceInformations'].map((e) => JobExperienceInformationTeacherModel.fromJson(e)),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'academicInformation': academicInformation,
      'contactInformation': contactInformation,
      'personalInformation': personalInformation,
      'jobExperienceInformations': jobExperienceInformations.map((e) => e).toList(),
    };
  }

  static ProfileTeacherModel toProfileTeacher(String str) {
    return ProfileTeacherModel.fromJson(jsonDecode(str));
  }
}
