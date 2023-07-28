import 'dart:convert';

import 'package:cards_store/http/http_service.dart';
import 'package:cards_store/models/login_response.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  Future<AuthResponse?> loginUser(String username,String password) async {
    http.Response res = await http.post(Uri.parse(HttpService.loginUrl), body: {'username': username,'password' : password});

    if (res.statusCode == 200) {
     // LoginResponse body = (res.body as LoginResponse);
      return AuthResponse.fromJson(jsonDecode(res.body));
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
