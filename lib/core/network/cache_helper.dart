import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;

  //! Here The Initialize of cache .
  Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  //! this method to put data in local database using key String
  static String? getDataString({required String key}) {
    debugPrint("---------getDataString----------$key");
    return sharedPreferences.getString(key);
  }

  //! this method to put data in local database using key List<String>
  static List<String> getStringList(String key) {
    return sharedPreferences.getStringList(key) ?? [];
  }

  //! this method to put data in local database using key
  static Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    debugPrint("----saveData--------$key,,,,,,,,,,,,,$value");

    if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    }
    if (value is String) {
      return await sharedPreferences.setString(key, value);
    }
    if (value is int) {
      return await sharedPreferences.setInt(key, value);
    }
    if (value is double) {
      return await sharedPreferences.setDouble(key, value);
    }
    if (value is List<String>) {
      return await sharedPreferences.setStringList(key, value);
    }

    throw Exception("Unsupported type");
  }

  //! this method to get data already saved in local database
  static dynamic getData({required String key}) {
    debugPrint("--------getData-----------$key");
    return sharedPreferences.get(key);
  }

  //! remove data using specific key
  static Future<bool> removeData({required String key}) async {
    debugPrint("--------removeData-----------$key");
    return await sharedPreferences.remove(key);
  }

  //! this method to check if local database contains {key}
  static Future<bool> containsKey({required String key}) async {
    debugPrint("--------containsKey-----------$key");
    return sharedPreferences.containsKey(key);
  }

  //! clear all data in the local database
  static Future<bool> clearData() async {
    debugPrint("--------clearData-----------");
    return await sharedPreferences.clear();
  }

  //! this method to put data in local database using key
  static Future<dynamic> put({
    required String key,
    required dynamic value,
  }) async {
    debugPrint("-------put------------$key,,,,,,,,,,,,,,,,,$value");
    if (value is String) {
      return await sharedPreferences.setString(key, value);
    } else if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    } else {
      return await sharedPreferences.setInt(key, value);
    }
  }
}