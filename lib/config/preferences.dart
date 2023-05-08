import 'package:flutter_agua_da_serra_app/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';


class Preferences {
  static SharedPreferences? _preferences;

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future<void> setString(String key, String value) async {
    await _preferences!.setString(key, value);
  }

  static String? getString(String key) {
    return _preferences!.getString(key);
  }

  static Future<void> setListNotifyDataCompare(List<User> list) async {
    final json = jsonEncode(list);
    await setString('arrayNotifyCompare', json);
  }

  static List<User>? getListNotifyDataCompare() {
    final json = getString('arrayNotifyCompare');
    if (json != null && json.isNotEmpty) {
      final list = jsonDecode(json) as List<dynamic>;
      return list.map((item) => User.fromJson(item)).toList();
    }
    return null;
  }

  static Future<void> saveInstanceTokenFcm(String key, String value) async {
    await setString(key, value);
  }

  static String? getInstanceTokenFcm() {
    return getString('token');
  }

  static Future<void> storeInt(String key, int value) async {
    await _preferences!.setInt(key, value);
  }

  static int getInt(String key, int defaultValue) {
    return _preferences!.getInt(key) ?? defaultValue;
  }

  static Future<void> setUserData(User? user) async {
    final json = user != null ? jsonEncode(user.toJson()) : '';
    await setString('getData', json);
  }

  static User? getUserData() {
    final json = getString('getData');
    if (json != null && json.isNotEmpty) {
      return User.fromJson(jsonDecode(json));
    }
    return null;
  }

  static Future<void> setLogin(bool enable) async {
    await _preferences!.setBool('login', enable);
  }

  static bool getLogin() {
    return _preferences!.getBool('login') ?? false;
  }

  static Future<void> clearUserData() async {
    await _preferences!.remove('getData');
    await _preferences!.remove('login');
    await _preferences!.remove('token');
    await _preferences!.remove('arrayNotifyCompare');
  }

  static const ENTERING_FIRST_TIME = 'EnteringFirstTime';
}
