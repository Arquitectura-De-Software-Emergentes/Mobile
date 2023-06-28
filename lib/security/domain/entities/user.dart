import 'enums/user_role.dart';

class User {
  final int id;
  final String username;
  final UserType role;
  User(this.id, this.username, this.role);
}