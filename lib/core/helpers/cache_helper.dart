// ignore_for_file: unnecessary_null_in_if_null_operators

import 'package:select_shop/core/constants/app_shared_pref.dart';
import 'package:select_shop/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? sharedPreferences;


    // String userToken='';
    // String userEmail ='';
    // String userLang ='';

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    userToken = await getData(key: "userToken");
    // setToken();
    // getUser
  }



//   static getUserData(){
// userToken = getData(key: AppSharedPrefrences.userToken) ?? '';
// userEmail = getData(key: AppSharedPrefrences.userEmail) ?? '';
// userLang = getData(key: AppSharedPrefrences.userLang) ?? '';
//    }
  static Future<bool> putBoolean(
      {required String key, required bool value}) async {
    return await sharedPreferences!.setBool(key, value);
  }

  static bool? getBoolean({required String key}) {
    return sharedPreferences!.getBool(key) ?? false;
  }

  static Future<bool> setData({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) return sharedPreferences!.setString(key, value);
    if (value is bool) return sharedPreferences!.setBool(key, value);
    if (value is int) return sharedPreferences!.setInt(key, value);
    return sharedPreferences!.setDouble(key, value);
  }

  static dynamic getData({
    required String key,
  }) {
    return sharedPreferences?.get(key) ?? null;
  }

  static Future<bool> removeData(String key) {
    return sharedPreferences!.remove(key);
  }
}
