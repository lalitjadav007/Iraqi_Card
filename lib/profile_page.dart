import 'package:cards_store/common_widgets.dart';
import 'package:cards_store/resources/translation_keys.dart' as translations;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/image_controller.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController firstnameController = TextEditingController(text: "");
  TextEditingController lastnameController = TextEditingController(text: "");
  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController phoneController = TextEditingController(text: "");
  TextEditingController addressController = TextEditingController(text: "");
  TextEditingController stateController = TextEditingController(text: "");
  TextEditingController zipController = TextEditingController(text: "");
  TextEditingController cityController = TextEditingController(text: "");
  TextEditingController countryController = TextEditingController(text: "");
  late Image _image;
  ImageController imageController = ImageController();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.height;
    return Padding(
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
                  builder: (value) => Container(
                    height:150,
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
              const SizedBox(height: 30,),
              buildTextField(
                label: translations.firstName.tr,
                inputType: TextInputType.name,
                validator: validateFirstName,
                imeAction: TextInputAction.next,
                maxLength: 25,
                controller: firstnameController,
              ),
              buildTextField(
                label: translations.lastName.tr,
                inputType: TextInputType.name,
                validator: validateLastName,
                maxLength: 25,
                imeAction: TextInputAction.next,
                controller: lastnameController,
              ),
              buildTextField(
                label: translations.emailAddress.tr,
                inputType: TextInputType.emailAddress,
                validator: validateEmailAddress,
                imeAction: TextInputAction.next,
                maxLength: 25,
                controller: emailController,
              ),
              buildTextField(
                label: translations.mobileNumber.tr,
                inputType: TextInputType.phone,
                imeAction: TextInputAction.next,
                validator: validatePhone,
                maxLength: 14,
                prefixText: "+91",
                controller: phoneController,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    child: Text(
                      translations.updateProfile.tr,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState?.validate() == true) {
                        print("valid Data");
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _onPictureSelection() async {
    imageController.getImageFromCamera();
  }

  String? validateFirstName(String? value) {
    if (value?.isEmpty == true) {
      return translations.firstNameValidation.tr;
    }
    return null;
  }

  String? validateLastName(String? value) {
    if (value?.isEmpty == true) {
      return translations.lastNameValidation.tr;
    }
    return null;
  }

  String? validateEmailAddress(String? value) {
    if (value?.isEmpty == true) {
      return translations.emailValidation.tr;
    }
    if (value?.contains('@') == false) {
      return translations.invalidEmailValidation.tr;
    }
    return null;
  }

  String? validatePhone(String? value) {
    if (value?.isEmpty == true) {
      return translations.phoneValidation.tr;
    }
    if (value!.length < 8) {
      return translations.invalidPhoneValidation.tr;
    }
    return null;
  }
}
