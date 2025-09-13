import 'dart:ffi';
import 'dart:ui';

import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {

  static Future<void> setStringList (String key, List<String> value) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setStringList(key, value);
  }

  static Future<List<String>> getStringList (String key) async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(key) ?? [];
  }

  static Future<void> setString (String key, String value) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }
  static Future<String> getString (String key) async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? "";
  }

  static Future<void> setInt(String key , int value) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setInt(key, value);
  }

  static Future<int> getInt (String key) async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key) ?? 0;
  }

  static Future<void> setDouble(String key , double value) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setDouble(key, value);
  }

  static Future<double> getDouble (String key) async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(key) ?? 0;
  }

  static Future<void> setBool(String key , bool value) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }

  static Future<bool> getBool (String key) async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key) ?? false;
  }

  static Future<void> remove (String key) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }


  static Future<void> clear (String key) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

}

