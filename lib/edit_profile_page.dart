import 'dart:convert';

import 'package:cards_store/common_widgets.dart';
import 'package:cards_store/controller/edit_profile_controller.dart';
import 'package:cards_store/models/login_response.dart';
import 'package:cards_store/preferences/shared_preferences.dart';
import 'package:cards_store/resources/translation_keys.dart' as translations;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/image_controller.dart';
import 'http/http_service.dart';
import 'models/update_profile_response.dart';

class EditProfilePage extends GetWidget<EditProfileController> {
  static var name = "/editProfile";

  EditProfilePage({super.key});

  ImageController imageController = ImageController();

  @override
  Widget build(BuildContext context) {
    ScaffoldMessengerState toast = ScaffoldMessenger.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(translations.titleEditProfile.tr),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16),
        child: SingleChildScrollView(
          physics: const ScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          child: Obx(() {
            var userDetails = controller.userProfile.value.data;
            if (userDetails != null) {
              var countryCode = "${userDetails.mobile!.substring(0, 3)} ";

              var imageUrl = "";
              if (userDetails.image != null &&
                  userDetails.image?.isNotEmpty == true) {
                imageUrl = "${HttpService.profileImageUrl}${userDetails.image}";
              } else {
                imageUrl =
                "https://t4.ftcdn.net/jpg/02/29/75/83/360_F_229758328_7x8jwCwjtBMmC6rgFzLFhZoEpLobB6L8.jpg";
              }

              return Column(
                children: [
                  GestureDetector(
                    onTap: () => {_onPictureSelection()},
                    child: GetBuilder<ImageController>(
                      // specify type as Controller
                      init: ImageController(),
                      builder: (value) =>
                          Container(
                            margin: const EdgeInsets.only(top: 30),
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: imageController.image.value == null
                                    ? NetworkImage(imageUrl)
                                    : FileImage(imageController.image.value!)
                                as ImageProvider,
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
                    errorText: controller.firstnameError.value,
                    imeAction: TextInputAction.next,
                    maxLength: 25,
                    controller: controller.firstnameController,
                  ),
                  buildTextField(
                    context,
                    label: translations.lastName.tr,
                    inputType: TextInputType.name,
                    errorText: controller.lastnameError.value,
                    maxLength: 25,
                    imeAction: TextInputAction.next,
                    controller: controller.lastnameController,
                  ),
                  buildTextField(
                    context,
                    label: translations.emailAddress.tr,
                    inputType: TextInputType.emailAddress,
                    errorText: controller.emailError.value,
                    imeAction: TextInputAction.next,
                    maxLength: 25,
                    controller: controller.emailController,
                  ),
                  buildPhoneTextField(
                    context,
                    label: translations.mobileNumber.tr,
                    maxLength: 25,
                    errorText: controller.phoneError.value,
                    imeAction: TextInputAction.next,
                    initialCountryCode:
                    controller.initialCountryCode.toString(),
                    controller: controller.phoneController,
                    onNumberSelected: (phone) {
                      controller.mobileCode = phone.countryCode.obs;
                      controller.countryCode = phone.countryISOCode.obs;
                      controller.mobile = phone.number.obs;
                    },
                  ),
                  buildTextField(
                    context,
                    label: translations.address.tr,
                    inputType: TextInputType.name,
                    errorText: controller.addressError.value,
                    maxLength: 25,
                    imeAction: TextInputAction.next,
                    controller: controller.addressController,
                  ),
                  buildTextField(
                    context,
                    label: translations.state.tr,
                    inputType: TextInputType.name,
                    errorText: controller.stateError.value,
                    maxLength: 25,
                    imeAction: TextInputAction.next,
                    controller: controller.stateController,
                  ),
                  buildTextField(
                    context,
                    label: translations.zipCode.tr,
                    inputType: TextInputType.name,
                    errorText: controller.zipError.value,
                    maxLength: 25,
                    imeAction: TextInputAction.next,
                    controller: controller.zipController,
                  ),
                  buildTextField(
                    context,
                    label: translations.city.tr,
                    inputType: TextInputType.name,
                    errorText: controller.cityError.value,
                    maxLength: 25,
                    imeAction: TextInputAction.next,
                    controller: controller.cityController,
                  ),
                  buildTextField(
                    context,
                    label: translations.country.tr,
                    inputType: TextInputType.name,
                    errorText: controller.countryError.value,
                    maxLength: 25,
                    imeAction: TextInputAction.next,
                    controller: controller.countryController,
                  ),
                  buildButton(
                    context,
                    translations.buttonUpdateProfile.tr,
                        () async {
                      FocusScope.of(context).unfocus();
                      if (!controller.isValid()) {
                        return;
                      }
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (BuildContext context) {
                          return getLoadingDialog();
                        },
                      );

                      UpdateProfileResponse? response;
                      /*if (imageController.image.value != null) {
                        response = await controller
                            .updateProfile(imageController.image.value);
                      } else {*/
                      response = await controller.updateProfile();
                      /*}*/
                      Navigator.pop(context);

                      if (response != null) {
                        debugPrint(response.message ?? "");

                        AuthResponse? loginUser = getLoginUser();
                        loginUser?.data?.user = response.data;
                        saveLoginUser(jsonEncode(loginUser?.toJson()));


                        toast.showSnackBar(SnackBar(
                          content: Text(response.message ?? ""),
                        ));

                        Navigator.pop(context);
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
    imageController.getImageFromGallery();
  }
}
