import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/login_response.dart';

SharedPreferences? _userPrefs;

loadPrefs() async {
  _userPrefs = await SharedPreferences.getInstance();
}

SharedPreferences? get getPrefs => _userPrefs;

saveLoginUser(String loginUser) {
  getPrefs?.setString("login_user", loginUser);
}

AuthResponse? getLoginUser() {
  String user = getPrefs?.getString("login_user") ?? "";
  if (user.isEmpty) {
    return null;
  } else {
    return AuthResponse.fromJson(jsonDecode(user));
  }
}
