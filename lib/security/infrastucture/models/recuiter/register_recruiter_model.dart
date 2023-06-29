import 'dart:convert';

import '../../../domain/recruiter_model.dart';

class RegisterRecruiterModel extends Recruiter{
  RegisterRecruiterModel({
    int? userId,
    required String username,
    required String password,
    required String position,
    required String role,
}): super(
  userId: userId ??0,
  username: username,
  password: password,
  position: position,
  role: role,
);
  factory RegisterRecruiterModel.fromJson(Map<String, dynamic> json) {
    return RegisterRecruiterModel(
      userId: json['userId'],
      username: json['username'],
      password: json['password'],
      position: json['position'],
      role: json['role'],
    );
  }
  Map<String,dynamic> toJson(){
    return {
      'userId': userId,
      'username': username,
      'password': password,
      'position': position,
      'role': role,
    };
  }
  static RegisterRecruiterModel toRegisterRecruiter(String str){
    return RegisterRecruiterModel.fromJson(jsonDecode(str));
  }
}