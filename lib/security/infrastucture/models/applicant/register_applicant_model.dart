import 'dart:convert';

import 'package:teacher_finder/security/domain/applicant_model.dart';
import 'package:teacher_finder/security/infrastucture/models/applicant/register_applicant_cv_model.dart';


class RegisterApplicantModel extends Applicant{
  RegisterApplicantModel({
     int? userId,
    required String password,
    required String username,
    required ApplicantCvModel cv,
    required String role,
  }) : super(
          userId: userId ?? 0,
          username: username,
          password: password,
          cv: cv,
          role: role,
        );

  factory RegisterApplicantModel.fromJson(Map<String, dynamic> json) {
    return RegisterApplicantModel(
      userId: json['userId'],
      password: json['password'],
      username: json['username'],
      cv: ApplicantCvModel.fromJson(json['cv']),
      role: json['role'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'username': username,
      'password': password,
      'cv': cv.toJson(),
      'role': role,
    };
  }
  static RegisterApplicantModel toRegisterApplicant(String str) {
    return RegisterApplicantModel.fromJson(jsonDecode(str));
  }

}
