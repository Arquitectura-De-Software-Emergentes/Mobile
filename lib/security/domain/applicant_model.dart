import 'applicant_cv.dart';

class Applicant{
  int userId;
  String username;
  String password;
  Cv cv;
  String role;

  Applicant({
    required this.userId,
    required this.username,
    required this.password,
    required this.cv,
    required this.role,
  });

}