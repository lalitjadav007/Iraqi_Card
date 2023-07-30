import 'package:cards_store/common_widgets.dart';
import 'package:cards_store/controller/edit_profile_controller.dart';
import 'package:cards_store/resources/translation_keys.dart' as translations;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/image_controller.dart';

class EditProfilePage extends StatefulWidget {
  static var name = "/editProfile";

  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  var profileController = Get.put(EditProfileController());

  final _formKey = GlobalKey<FormState>();
  TextEditingController firstnameController = TextEditingController(text: "");
  TextEditingController lastnameController = TextEditingController(text: "");
  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController phoneController = TextEditingController(text: "");

  String? firstnameError, lastnameError, emailError, phoneError;

  late Image _image;
  ImageController imageController = ImageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(translations.titleEditProfile.tr),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 10),
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          physics: const ScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          child: Form(
            key: _formKey,
            child: Column(
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
                              image: imageController.image == null
                                  ? const NetworkImage(
                                  'https://picsum.photos/250?image=9')
                                  : FileImage(imageController.image!)
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
                  label: translations.firstName.tr,
                  inputType: TextInputType.name,
                  errorText: firstnameError,
                  imeAction: TextInputAction.next,
                  maxLength: 25,
                  controller: firstnameController,
                ),
                buildTextField(
                  label: translations.lastName.tr,
                  inputType: TextInputType.name,
                  errorText: lastnameError,
                  maxLength: 25,
                  imeAction: TextInputAction.next,
                  controller: lastnameController,
                ),
                buildTextField(
                  label: translations.emailAddress.tr,
                  inputType: TextInputType.emailAddress,
                  errorText: emailError,
                  imeAction: TextInputAction.next,
                  maxLength: 25,
                  controller: emailController,
                ),
                buildTextField(
                  label: translations.mobileNumber.tr,
                  inputType: TextInputType.phone,
                  imeAction: TextInputAction.next,
                  errorText: phoneError,
                  maxLength: 14,
                  prefixText: "+91",
                  controller: phoneController,
                ),
                buildButton(context, translations.buttonUpdateProfile.tr, () =>
                    () {
                  if (_formKey.currentState?.validate() == true) {

                  }
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _onPictureSelection() async {
    imageController.getImageFromCamera();
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
}
