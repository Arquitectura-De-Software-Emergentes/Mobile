import 'package:teacher_finder/security/application/shared_preference_service.dart';

class UserConfig {
  static Future<int> getUserId() async {
    var userSaved = await SharedPreferenceService().getUserInfo();
    return userSaved.id;
  }
}
