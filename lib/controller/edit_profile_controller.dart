import 'dart:convert';
import 'dart:io';

import 'package:cards_store/http/http_service.dart';
import 'package:cards_store/models/update_profile_response.dart';
import 'package:cards_store/resources/translation_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/get_profile_response.dart';
import '../preferences/shared_preferences.dart';

class EditProfileController extends GetxController {
  Rx<GetProfileResponse> userProfile = GetProfileResponse().obs;
  Rx<String> message = "".obs;
  String userId = "";

  EditProfileController() {
    userId = getLoginUser()?.data?.user?.id?.toString() ?? "0";
    debugPrint(userId);
    getUserProfile(userId);
  }

  getUserProfile(String userId) async {
    debugPrint(HttpService.getProfileUrl);
    http.Response res = await http
        .post(Uri.parse(HttpService.getProfileUrl), body: {'user_id': userId});

    if (res.statusCode == 200) {
      GetProfileResponse response =
      GetProfileResponse.fromJson(jsonDecode(res.body));
      if (response.status == 1) {
        userProfile.value = response;
      } else {
        userProfile.value = GetProfileResponse();
      }
    } else {
      message.value = "Unable to retrieve profile details";
    }
  }

  Future<UpdateProfileResponse?> updateProfile(String firstname,
      String lastname,
      String email,
      String phone,
      String address,
      String state,
      String zip,
      String city,
      String country,
      [File? image]) async {
    Object? body;

    if (image != null) {
      body = {
        "user_id": userId,
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
        "mobile": "+93" + mobileNumber,
        "address": address,
        "state": state,
        "zip": zip,
        "city": city,
        "country": country,
        "image": image,
      };
    } else {
      body = {
        "user_id": userId,
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
        "mobile": "+93" + mobileNumber,
        "address": address,
        "state": state,
        "zip": zip,
        "city": city,
        "country": country
      };
    }

    http.Response res =
    await http.post(Uri.parse(HttpService.editProfileUrl), body: body);

    if (res.statusCode == 200) {
      UpdateProfileResponse response =
      UpdateProfileResponse.fromJson(jsonDecode(res.body));
      if (response.status == 1) {
        return response;
      } else {
        return UpdateProfileResponse();
      }
    } else {
      throw "Unable to retrieve posts.";
    }
  }
}
