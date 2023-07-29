import 'dart:convert';

import 'package:cards_store/models/get_profile_response.dart';
import 'package:cards_store/preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../http/http_service.dart';

class ProfileController extends GetxController {
  Rx<GetProfileResponse> userProfile = GetProfileResponse().obs;
  Rx<String> message = "".obs;

  ProfileController(){
    String userId = getLoginUser()?.data?.user?.id?.toString() ?? "0";
    debugPrint(userId);
    getUserProfile(userId);
  }

  getUserProfile(String userId) async {
    debugPrint(HttpService.getProfileUrl);
    http.Response res = await http
        .post(Uri.parse(HttpService.getProfileUrl), body: {'user_id': userId});

    if (res.statusCode == 200) {
      GetProfileResponse response = GetProfileResponse.fromJson(jsonDecode(res.body));
      if (response.status == 1) {
        userProfile.value = response;
      } else {
        userProfile.value = GetProfileResponse();
      }
    } else {
      message.value = "Unable to retrieve profile details";
    }
  }
}
