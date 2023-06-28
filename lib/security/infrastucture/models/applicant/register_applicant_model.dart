import 'dart:convert';
import 'dart:html';

import 'package:teacher_finder/security/domain/applicant_model.dart';
import 'package:teacher_finder/security/infrastucture/models/applicant/register_applicant_cv_model.dart';


class RegisterApplicantModel extends Applicant{
  RegisterApplicantModel({
    required int userId,
    required String username,
    required ApplicantCvModel cv,
    required String role,
  }) : super(
          userId: userId,
          username: username,
          cv: cv,
          role: role,
        );

  factory RegisterApplicantModel.fromJson(Map<String, dynamic> json) {
    return RegisterApplicantModel(
      userId: json['userId'],
      username: json['username'],
      cv: ApplicantCvModel.fromJson(json['cv']),
      role: json['role'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'username': username,
      'cv': cv,
      'role': role,
    };
  }
  static RegisterApplicantModel toRegisterApplicant(String str) {
    return RegisterApplicantModel.fromJson(jsonDecode(str));
  }

}
