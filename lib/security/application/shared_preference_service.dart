import 'dart:async' show Future;
import 'package:shared_preferences/shared_preferences.dart';
import '../domain/entities/user.dart';
import '../infrastructure/models/login_model.dart';

class SharedPreferenceService {
  Future<bool> isUserLogged() async {
    var _prefs = await SharedPreferences.getInstance();
    var isLogged = _prefs?.getBool('logged') ?? false;
    return isLogged;
  }

  Future<bool?> saveUserInfo(
      int id, String name, String role) async {
    var _prefs = await SharedPreferences.getInstance();
    await _prefs?.setInt('id', id);
    await _prefs?.setString('username', name);
    await _prefs?.setString('role', role);
    await _prefs.setBool('logged', true);
    return true;
  }

  Future<bool> deleteUserInfo() async {
    var _prefs = await SharedPreferences.getInstance();
    await _prefs?.remove('id');
    await _prefs?.remove('username');
    await _prefs?.remove('role');
    await _prefs.remove('logged');
    return true;
  }

  Future<User> getUserInfo() async {
    var _prefs = await SharedPreferences.getInstance();
    var id = await _prefs?.getInt('id') ?? 0;
    var name = await _prefs?.getString('username') ?? '';
    var roleString = await _prefs?.getString('role') ?? '';
    var role = LoginModel.getCategoryType(roleString);
    var user = User(id, name, role);
    return user;
  }
}
