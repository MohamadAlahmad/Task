import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/user.dart';

class Prefs {

  SharedPreferences? _prefs;

  setValue(User user, String key) async {
    _prefs = await SharedPreferences.getInstance();
    final userJson = json.encode(user.toJason());
    await _prefs!.setString(key, userJson);
  }

  Future<User?> getValue(String key) async {
    _prefs = await SharedPreferences.getInstance();
    final userJson = _prefs!.getString(key);
    User tempUser = User.fromJason(json.decode(userJson!));
    return tempUser;
  }

}