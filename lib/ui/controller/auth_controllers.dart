import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_management/model/user_model.dart';

class AuthControllers {
  static final String _tokenKey = 'token';
  static final String _userKey = 'user';
  static String? accesstoken;
  static UserModel? user;

  static Future<void> saveuserData(String token, UserModel userModel) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(_tokenKey, token);
    await sharedPreferences.setString(_userKey, jsonEncode(userModel.toJson()));
    accesstoken = token;
    user = userModel;
  }

  static Future<void> getUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString(_tokenKey);

    if (token != null) {
      accesstoken = token;
      user = UserModel.fromjson(
        jsonDecode(sharedPreferences.getString(_userKey)!),
      );
    }
  }

  static Future<bool> isUserLoggedIn() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString(_tokenKey);
    return token != null;
  }

  static Future<void> clearUserData() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
  }
}
