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
import 'package:cards_store/resources/translation_keys.dart' as translations;

class EditProfileController extends GetxController {
  Rx<GetProfileResponse> userProfile = GetProfileResponse().obs;
  Rx<String> message = "".obs;
  String userId = "";

  TextEditingController firstnameController = TextEditingController(text: "");
  TextEditingController lastnameController = TextEditingController(text: "");
  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController phoneController = TextEditingController(text: "");
  TextEditingController addressController = TextEditingController(text: "");
  TextEditingController stateController = TextEditingController(text: "");
  TextEditingController zipController = TextEditingController(text: "");
  TextEditingController cityController = TextEditingController(text: "");
  TextEditingController countryController = TextEditingController(text: "");

  Rx<String?> firstnameError = null.obs;
  Rx<String?> lastnameError = null.obs;
  Rx<String?> emailError = null.obs;
  Rx<String?> phoneError = null.obs;
  Rx<String?> addressError = null.obs;
  Rx<String?> stateError = null.obs;
  Rx<String?> zipError = null.obs;
  Rx<String?> cityError = null.obs;
  Rx<String?> countryError = null.obs;

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
        setupData();
      } else {
        userProfile.value = GetProfileResponse();
      }
    } else {
      message.value = "Unable to retrieve profile details";
    }
  }

  Future<UpdateProfileResponse?> updateProfile([File? image]) async {
    Object? body;

    if (image != null) {
      body = {
        "user_id": userId,
        "firstname": firstnameController.text,
        "lastname": lastnameController.text,
        "email": emailController.text,
        "mobile": "+93" + mobileNumber,
        "address": addressController.text,
        "state": stateController.text,
        "zip": zipController.text,
        "city": cityController.text,
        "country": countryController.text,
        "image": image,
      };
    } else {
      body = {
        "user_id": userId,
        "firstname": firstnameController.text,
        "lastname": lastnameController.text,
        "email": emailController.text,
        "mobile": phoneController.text,
        "address": addressController.text,
        "state": stateController.text,
        "zip": zipController.text,
        "city": cityController.text,
        "country": countryController.text,
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

  void setupData() {
    firstnameController.text = userProfile.value.data?.firstname ?? "";
    lastnameController.text = userProfile.value.data?.lastname ?? "";
    emailController.text = userProfile.value.data?.email ?? "";
    var phone = userProfile.value.data?.mobile
        ?.substring(3, userProfile.value.data?.mobile?.length);
    phoneController.text = phone ?? "";
    addressController.text = "${userProfile.value.data?.address?.address}";
    stateController.text = "${userProfile.value.data?.address?.state}";
    zipController.text = "${userProfile.value.data?.address?.zip}";
    cityController.text = "${userProfile.value.data?.address?.city}";
    countryController.text = "${userProfile.value.data?.address?.country}";
  }

  bool isValid() {
    firstnameError.value = _firstNameErrorText;
    lastnameError.value = _lastNameErrorText;
    emailError.value = _emailErrorText;
    phoneError.value = _phoneErrorText;
    addressError.value = _addressErrorText;
    stateError.value = _stateErrorText;
    zipError.value = _zipErrorText;
    cityError.value = _cityErrorText;
    countryError.value = _countryErrorText;

    return _firstNameErrorText == null ||
        _lastNameErrorText == null ||
        _emailErrorText == null ||
        _phoneErrorText == null ||
        _addressErrorText == null ||
        _stateErrorText == null ||
        _zipErrorText == null ||
        _cityErrorText == null ||
        _countryErrorText == null;
  }

  String? get _emailErrorText {
    final text = emailController.value.text;
    if (text.isEmpty == true) {
      return translations.emptyEmailValidation.tr;
    }
    if (text.contains('@') == false) {
      return translations.invalidEmailValidation.tr;
    }
    // return null if the text is valid
    return null;
  }

  String? get _firstNameErrorText {
    final value = firstnameController.value.text;
    if (value.isEmpty == true) {
      return translations.firstNameValidation.tr;
    }
    return null;
  }

  String? get _lastNameErrorText {
    final value = lastnameController.value.text;
    if (value.isEmpty == true) {
      return translations.firstNameValidation.tr;
    }
    return null;
  }

  String? get _phoneErrorText {
    final value = phoneController.value.text;
    if (value.isEmpty == true) {
      return translations.phoneValidation.tr;
    }
    if (value.length < 8) {
      return translations.invalidPhoneValidation.tr;
    }
    return null;
  }

  String? get _addressErrorText {
    final value = addressController.value.text;
    if (value.isEmpty == true) {
      return translations.addressValidation.tr;
    }
    return null;
  }

  String? get _stateErrorText {
    final value = stateController.value.text;
    if (value.isEmpty == true) {
      return translations.stateValidation.tr;
    }
    return null;
  }

  String? get _zipErrorText {
    final value = zipController.value.text;
    if (value.isEmpty == true) {
      return translations.zipValidation.tr;
    }
    return null;
  }

  String? get _cityErrorText {
    final value = cityController.value.text;
    if (value.isEmpty == true) {
      return translations.cityValidation.tr;
    }
    return null;
  }

  String? get _countryErrorText {
    final value = countryController.value.text;
    if (value.isEmpty == true) {
      return translations.countryValidation.tr;
    }
    return null;
  }
}
