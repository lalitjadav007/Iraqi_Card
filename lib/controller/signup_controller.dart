import 'dart:convert';

import 'package:cards_store/http/http_service.dart';
import 'package:cards_store/models/register_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SignupController extends GetxController {
  Future<RegisterResponse?> registerUser(String firstname,
      String lastname,
      String username,
      String email,
      String mobile,
      String password,
      String passwordConfirmation,
      String agree,
      String mobileCode,
      String countryCode,
      String country) async {
    debugPrint(country);
    http.Response res =
    await http.post(Uri.parse(HttpService.registerUrl), body: {
      "firstname": firstname,
      "lastname": lastname,
      "username": username,
      "email": email,
      "mobile": mobile,
      "password": password,
      "password_confirmation": passwordConfirmation,
      "mobile_code": mobileCode,
      "country_code": countryCode,
      "country": country,
      "agree": agree
    });

    if (res.statusCode == 200) {
      // LoginResponse body = (res.body as LoginResponse);
      print(res.body);
      return RegisterResponse.fromJson(jsonDecode(res.body));
      //return body;
      // List<User> posts = body
      //     .map(
      //       (dynamic item) => User.fromJson(item),
      // )
      //     .toList();
      //
      // return posts;
    } else {
      throw "Unable to retrieve posts.";
    }
  }
}
