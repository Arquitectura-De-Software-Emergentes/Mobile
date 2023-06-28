import 'dart:convert';
import 'package:teacher_finder/security/application/shared_preference_service.dart';
import '../../common/api_config/api_config.dart';
import 'package:http/http.dart' as http;
import '../domain/entities/user.dart';
import '../infrastructure/models/login_model.dart';

abstract class BaseAuth {
  Future<String> currentUserId();
  Future<User> currentUser();
  Future<bool> signIn(String email, String password);
  Future<String> createUser(String email, String password);
  Future<void> signOut();
}

class AuthImplementation extends BaseAuth {
  @override
  Future<String> currentUserId() async {
    var user = await SharedPreferenceService().getUserInfo();
    return user.id.toString();
  }

  @override
  Future<User> currentUser() async {
    var user = await SharedPreferenceService().getUserInfo();
    return user;
  }

  @override
  Future<bool> signIn(String email, String password) async {
    try {
      String url = "${ApiConfig.baseUrl}/auth/auth/login";
      final headers = {'Content-Type': 'application/json'};
      final body = {
        "username": email,
        "password": password,
      };
      final response = await http.post(Uri.parse(url),
          body: jsonEncode(body), headers: headers);
      if (response.statusCode == 200) {
        var decodedJson = json.decode(response.body).cast<String, dynamic>();
        var user = LoginModel.fromJson(decodedJson);
        var loginManager = SharedPreferenceService();
        loginManager.saveUserInfo(user.userId, user.username, user.role);
        var haha = await loginManager.getUserInfo();
        return true;
      } else {
        return false;
      }
    } catch (error) {
      throw Exception('Failed to fetch offers: $error');
    }
  }

  @override
  Future<String> createUser(String email, String password) async {
    // Implementa el código para crear un nuevo usuario con email y contraseña
    // Retorna el ID del nuevo usuario creado
    return "new_user_id";
  }

  @override
  Future<void> signOut() async {
    // Implementa el código para cerrar sesión
    // No retorna ningún valor, ya que no se necesita para el BLoC
    return;
  }

}



