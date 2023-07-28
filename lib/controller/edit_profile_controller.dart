import 'dart:convert';

import 'package:cards_store/http/http_service.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class EditProfileController extends GetxController {

  Future<void> updateProfile(String email) async {
    http.Response res = await http
        .post(Uri.parse(HttpService.updateProfileURL), body: {'email': email});

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

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
