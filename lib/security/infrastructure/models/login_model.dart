
import '../../domain/entities/enums/user_role.dart';

class LoginModel {
  int userId;
  String username;
  String role;

  LoginModel(
      {required this.userId, required this.username, required this.role});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      userId: json["user"]["userId"],
      username: json['user']['username'],
      role: json['user']['role'],
    );
  }

  static UserType getCategoryType(dynamic category) {
    switch (category) {
      case "APPLICANT":
        {
          return UserType.applicant;
        }
      case "RECRUITER":
        {
          return UserType.recruiter;
        }
      default:
        {
          return UserType.applicant;
        }
    }
  }
}
