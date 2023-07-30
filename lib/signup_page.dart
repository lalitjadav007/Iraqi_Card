import 'dart:async';

import 'package:cards_store/login_page.dart';
import 'package:cards_store/models/register_response.dart';
import 'package:cards_store/resources/translation_keys.dart' as translations;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'common_widgets.dart';
import 'controller/signup_controller.dart';

class SignupPage extends StatefulWidget {
  static var name = "/signup";

  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  var signupController = Get.put(SignupController());
  TextEditingController firstnameController = TextEditingController(text: "");
  TextEditingController lastnameController = TextEditingController(text: "");
  final TextEditingController emailController = TextEditingController(text: "");
  final TextEditingController passwordController =
  TextEditingController(text: "");
  TextEditingController confirmPasswordController =
  TextEditingController(text: "");
  TextEditingController phoneController = TextEditingController(text: "");
  TextEditingController usernameController = TextEditingController(text: "");
  String? firstnameError,
      lastnameError,
      emailError,
      passwordError,
      confirmPasswordError,
      phoneError,
      usernameError;

  String? mobileCode = "+93",
      countryCode = "AF",
      country = "Afghanistan",
      mobile = "";

  bool agree = false;

  @override
  Widget build(BuildContext context) {
    ScaffoldMessengerState toast = ScaffoldMessenger.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text("Create an account"),
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery
            .of(context)
            .size
            .width,
        margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          physics: const ScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                "Let's get you started",
                style: Theme
                    .of(context)
                    .textTheme
                    .headlineSmall,
              ),
              Text(
                "Fill in the form below, correctly",
                style: Theme
                    .of(context)
                    .textTheme
                    .bodyLarge,
              ),
              Container(
                margin: const EdgeInsets.only(top: 30),
                child: buildTextField(
                  context,
                  label: translations.firstName.tr,
                  inputType: TextInputType.name,
                  errorText: firstnameError,
                  imeAction: TextInputAction.next,
                  maxLength: 25,
                  controller: firstnameController,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: buildTextField(
                  context,
                  label: translations.lastName.tr,
                  inputType: TextInputType.name,
                  errorText: lastnameError,
                  maxLength: 25,
                  imeAction: TextInputAction.next,
                  controller: lastnameController,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: buildTextField(
                  context,
                  label: translations.username.tr,
                  inputType: TextInputType.name,
                  errorText: usernameError,
                  maxLength: 25,
                  imeAction: TextInputAction.next,
                  controller: usernameController,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: buildTextField(
                  context,
                  label: translations.emailAddress.tr,
                  inputType: TextInputType.emailAddress,
                  imeAction: TextInputAction.next,
                  maxLength: 25,
                  errorText: emailError,
                  controller: emailController,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: buildPhoneTextField(
                  context,
                  label: translations.mobileNumber.tr,
                  maxLength: 25,
                  errorText: phoneError,
                  imeAction: TextInputAction.next,
                  controller: phoneController,
                  onNumberSelected: (phone) {
                    mobileCode = phone.countryCode;
                    countryCode = phone.countryISOCode;
                    mobile = phone.number;
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: buildTextField(
                  context,
                  label: translations.password.tr,
                  inputType: TextInputType.visiblePassword,
                  maxLength: 25,
                  errorText: passwordError,
                  imeAction: TextInputAction.next,
                  controller: passwordController,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: buildTextField(
                  context,
                  label: translations.confirmPassword.tr,
                  inputType: TextInputType.visiblePassword,
                  maxLength: 25,
                  errorText: confirmPasswordError,
                  imeAction: TextInputAction.done,
                  controller: confirmPasswordController,
                ),
              ),
              CheckboxListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  'I accept all Terms of Service , Privacy Policy',
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodyMedium,
                ),
                value: agree,
                controlAffinity: ListTileControlAffinity.leading,
                onChanged: (bool? value) {
                  setState(() {
                    agree = value ?? false;
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),
              buildButton(context, translations.buttonSignup.tr, () async {
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
                  _usernameErrorText != null
                      ? usernameError = _usernameErrorText
                      : usernameError = null;
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
                  _passwordErrorText != null
                      ? passwordError = _passwordErrorText
                      : passwordError = null;
                  return;
                });
                setState(() {
                  _confirmPasswordErrorText != null
                      ? confirmPasswordError = _confirmPasswordErrorText
                      : confirmPasswordError = null;
                  return;
                });

                if (agree == false) {
                  FocusScope.of(context).unfocus();
                  toast.showSnackBar(SnackBar(
                    content: Text("Please agree to terms and conditions."),
                  ));
                  return;
                }

                if (_firstNameErrorText == null &&
                    _lastNameErrorText == null &&
                    _emailErrorText == null &&
                    _phoneErrorText == null &&
                    _passwordErrorText == null &&
                    _usernameErrorText == null &&
                    _confirmPasswordErrorText == null) {
                  print("Valid");

                  FocusScope.of(context).unfocus();

                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (BuildContext context) {
                      return getLoadingDialog();
                    },
                  );

                  RegisterResponse? response =
                  await signupController.registerUser(
                      firstnameController.text,
                      lastnameController.text,
                      usernameController.text,
                      emailController.text,
                      mobile ?? "",
                      passwordController.text,
                      passwordController.text,
                      agree.toString(),
                      mobileCode ?? "",
                      countryCode ?? "",
                      country ?? "");

                  Get.back();
                  if (response != null) {
                    toast.showSnackBar(SnackBar(
                      content: Text(response.message?.success?[0] ?? ""),
                    ));
                    Timer(const Duration(seconds: 2), () {
                      Get.off(const LoginPage());
                    });
                  }
                }
              }, margin: EdgeInsets.zero),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: 'Already have an account ',
                          style: Theme
                              .of(context)
                              .textTheme
                              .bodyMedium),
                      TextSpan(
                        text: 'Sign In',
                        style: Theme
                            .of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Colors.deepPurple,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.back();
                          },
                      ),
                    ]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
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

  String? get _usernameErrorText {
    final value = usernameController.value.text;
    if (value.isEmpty == true) {
      return translations.emptyUsernameValidation.tr;
    }
    return null;
  }

  String? get _emailErrorText {
    final text = emailController.value.text;
    if (text.isEmpty == true) {
      return translations.emptyEmailValidation.tr;
    }
    if (text.contains('@') == false) {
      return translations.invalidEmailValidation.tr;
    }
    return null;
  }

  String? get _passwordErrorText {
    final text = passwordController.value.text;
    if (text.isEmpty == true) {
      return translations.emptyPasswordValidation.tr;
    }
    if (text.length < 6) {
      return translations.passwordLengthValidation.tr;
    }
    return null;
  }

  String? get _confirmPasswordErrorText {
    final text = confirmPasswordController.value.text;
    if (text.isEmpty == true) {
      return translations.emptyConfirmPasswordValidation.tr;
    }
    if (text.length < 6) {
      return translations.passwordLengthValidation.tr;
    }
    if (passwordController.text != confirmPasswordController.text) {
      return translations.wrongConfirmPasswordValidation.tr;
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
}
