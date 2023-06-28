import 'dart:convert';

import '../../../domain/recruiter_model.dart';

class RecruiterModel extends Recruiter{
  RecruiterModel({
    required int userId,
    required String username,
    required String position,
    required String role,
}): super(
  userId: userId,
  username: username,
  position: position,
  role: role,
);
  factory RecruiterModel.fromJson(Map<String, dynamic> json) {
    return RecruiterModel(
      userId: json['userId'],
      username: json['username'],
      position: json['position'],
      role: json['role'],
    );
  }
  Map<String,dynamic> toJson(){
    return {
      'userId': userId,
      'username': username,
      'position': position,
      'role': role,
    };
  }
  static RecruiterModel toRecruiter(String str){
    return RecruiterModel.fromJson(jsonDecode(str));
  }
}