import 'dart:convert';

import 'package:cards_store/models/get_profile_response.dart';
import 'package:cards_store/preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../http/http_service.dart';

class ProfileController extends GetxController {
  Future<GetProfileResponse?> getUserProfile(String userId) async {
    http.Response res = await http
        .post(Uri.parse(HttpService.getProfileUrl), body: {'user_id': userId});

    if (res.statusCode == 200) {
      GetProfileResponse response =
          GetProfileResponse.fromJson(jsonDecode(res.body));
      if (response.status == 1) {
        return response;
      } else {
        return GetProfileResponse();
      }
    } else {
      throw "Unable to retrieve posts.";
    }
  }
}
