import 'dart:io';

import 'package:cards_store/common_widgets.dart';
import 'package:cards_store/controller/edit_profile_controller.dart';
import 'package:cards_store/resources/translation_keys.dart' as translations;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/image_controller.dart';
import 'http/http_service.dart';
import 'models/update_profile_response.dart';

class EditProfilePage extends StatefulWidget {
  static var name = "/editProfile";

  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  var editProfileController = Get.put(EditProfileController());

  TextEditingController firstnameController = TextEditingController(text: "");
  TextEditingController lastnameController = TextEditingController(text: "");
  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController phoneController = TextEditingController(text: "");
  TextEditingController addressController = TextEditingController(text: "");
  TextEditingController stateController = TextEditingController(text: "");
  TextEditingController zipController = TextEditingController(text: "");
  TextEditingController cityController = TextEditingController(text: "");
  TextEditingController countryController = TextEditingController(text: "");

  String? firstnameError,
      lastnameError,
      emailError,
      phoneError,
      addressError,
      stateError,
      zipError,
      cityError,
      countryError;

  File? imageFile;
  ImageController imageController = ImageController();

  @override
  Widget build(BuildContext context) {
    ScaffoldMessengerState toast = ScaffoldMessenger.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(translations.titleEditProfile.tr),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 10),
        child: SingleChildScrollView(
          physics: const ScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          child: Obx(() {
            var userDetails = editProfileController.userProfile.value.data;
            if (userDetails != null) {
              firstnameController.text = "${userDetails.firstname}";
              lastnameController.text = "${userDetails.lastname}";
              emailController.text = "${userDetails.email}";
              var phone =
                  userDetails.mobile?.substring(3, userDetails.mobile?.length);
              phoneController.text = phone ?? "";
              var countryCode = "${userDetails.mobile!.substring(0, 3)} ";

              var imageUrl = "";
              if (userDetails.image != null &&
                  userDetails.image?.isNotEmpty == true) {
                imageUrl = "${HttpService.profileImageUrl}${userDetails.image}";
              } else {
                imageUrl =
                    "https://t4.ftcdn.net/jpg/02/29/75/83/360_F_229758328_7x8jwCwjtBMmC6rgFzLFhZoEpLobB6L8.jpg";
              }

              addressController.text = "${userDetails.address?.address}";
              stateController.text = "${userDetails.address?.state}";
              zipController.text = "${userDetails.address?.zip}";
              cityController.text = "${userDetails.address?.city}";
              countryController.text = "${userDetails.address?.country}";

              return Column(
                children: [
                  GestureDetector(
                    onTap: () => {_onPictureSelection()},
                    child: GetBuilder<ImageController>(
                      // specify type as Controller
                      init: ImageController(),
                      builder: (value) => Container(
                        margin: const EdgeInsets.only(top: 30),
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: imageFile == null
                                ? NetworkImage(imageUrl)
                                : FileImage(imageFile!) as ImageProvider,
                            fit: BoxFit.cover,
                          ),
                          border: Border.all(
                            width: 1.0,
                            color: Colors.grey,
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(100.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  buildTextField(
                    context,
                    label: translations.firstName.tr,
                    inputType: TextInputType.name,
                    errorText: firstnameError,
                    imeAction: TextInputAction.next,
                    maxLength: 25,
                    controller: firstnameController,
                  ),
                  buildTextField(
                    context,
                    label: translations.lastName.tr,
                    inputType: TextInputType.name,
                    errorText: lastnameError,
                    maxLength: 25,
                    imeAction: TextInputAction.next,
                    controller: lastnameController,
                  ),
                  buildTextField(
                    context,
                    label: translations.emailAddress.tr,
                    inputType: TextInputType.emailAddress,
                    errorText: emailError,
                    imeAction: TextInputAction.next,
                    maxLength: 25,
                    controller: emailController,
                  ),
                  buildTextField(
                    context,
                    label: translations.mobileNumber.tr,
                    inputType: TextInputType.phone,
                    imeAction: TextInputAction.next,
                    errorText: phoneError,
                    maxLength: 14,
                    prefixText: countryCode,
                    controller: phoneController,
                  ),
                  buildTextField(
                    context,
                    label: translations.address.tr,
                    inputType: TextInputType.name,
                    errorText: addressError,
                    maxLength: 25,
                    imeAction: TextInputAction.next,
                    controller: addressController,
                  ),
                  buildTextField(
                    context,
                    label: translations.state.tr,
                    inputType: TextInputType.name,
                    errorText: stateError,
                    maxLength: 25,
                    imeAction: TextInputAction.next,
                    controller: stateController,
                  ),
                  buildTextField(
                    context,
                    label: translations.zipCode.tr,
                    inputType: TextInputType.name,
                    errorText: zipError,
                    maxLength: 25,
                    imeAction: TextInputAction.next,
                    controller: zipController,
                  ),
                  buildTextField(
                    context,
                    label: translations.city.tr,
                    inputType: TextInputType.name,
                    errorText: cityError,
                    maxLength: 25,
                    imeAction: TextInputAction.next,
                    controller: cityController,
                  ),
                  buildTextField(
                    context,
                    label: translations.country.tr,
                    inputType: TextInputType.name,
                    errorText: countryError,
                    maxLength: 25,
                    imeAction: TextInputAction.next,
                    controller: countryController,
                  ),
                  buildButton(
                    context,
                    translations.buttonUpdateProfile.tr,
                    () => () async {
                      setState(() {
                        _firstNameErrorText != null
                            ? firstnameError = _firstNameErrorText
                            : firstnameError = null;
                        return;
                      });
                      setState(() {
                        _lastNameErrorText != null
                            ? lastnameError = _lastNameErrorText
                            : lastnameError = null;
                        return;
                      });
                      setState(() {
                        _emailErrorText != null
                            ? emailError = _emailErrorText
                            : emailError = null;
                        return;
                      });
                      setState(() {
                        _phoneErrorText != null
                            ? phoneError = _phoneErrorText
                            : phoneError = null;
                        return;
                      });
                      setState(() {
                        _addressErrorText != null
                            ? addressError = _addressErrorText
                            : addressError = null;
                        return;
                      });
                      setState(() {
                        _stateErrorText != null
                            ? stateError = _stateErrorText
                            : stateError = null;
                        return;
                      });
                      setState(() {
                        _zipErrorText != null
                            ? zipError = _zipErrorText
                            : zipError = null;
                        return;
                      });
                      setState(() {
                        _cityErrorText != null
                            ? cityError = _cityErrorText
                            : cityError = null;
                        return;
                      });
                      setState(
                        () {
                          _countryErrorText != null
                              ? countryError = _countryErrorText
                              : countryError = null;
                          return;
                        },
                      );

                      if (_firstNameErrorText == null &&
                          _lastNameErrorText == null &&
                          _emailErrorText == null &&
                          _phoneErrorText == null &&
                          _addressErrorText == null &&
                          _zipErrorText == null &&
                          _stateErrorText == null &&
                          _cityErrorText == null &&
                          _countryErrorText == null) {
                        debugPrint("valid");

                        showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (BuildContext context) {
                            return getLoadingDialog();
                          },
                        );

                        UpdateProfileResponse? response;
                        if (imageFile != null) {
                          response = await editProfileController.updateProfile(
                              firstnameController.text,
                              lastnameController.text,
                              emailController.text,
                              phoneController.text,
                              addressController.text,
                              stateController.text,
                              zipController.text,
                              cityController.text,
                              countryController.text,
                              imageFile);
                        } else {
                          response = await editProfileController.updateProfile(
                              firstnameController.text,
                              lastnameController.text,
                              emailController.text,
                              phoneController.text,
                              addressController.text,
                              stateController.text,
                              zipController.text,
                              cityController.text,
                              countryController.text);
                        }
                        Get.back();

                        if (response != null) {
                          toast.showSnackBar(SnackBar(
                            content: Text(response.message ?? ""),
                          ));
                          Get.back();
                        }
                      }
                    },
                  ),
                ],
              );
            } else if (userDetails == null) {
              Get.showSnackbar(const GetSnackBar(
                message: "Error while fetching profile data",
              ));
              return const Center(child: CircularProgressIndicator());
            }
            return const Center(child: CircularProgressIndicator());
          }),
        ),
      ),
    );
  }

  _onPictureSelection() async {
    File? file = await imageController.getImageFromGallery();
    if (file != null) {
      setState(() {
        imageFile = file;
      });
    }
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
    final value = firstnameController.value.text;
    if (value.isEmpty == true) {
      return translations.firstNameValidation.tr;
    }
    return null;
  }

  String? get _phoneErrorText {
    final value = firstnameController.value.text;
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
