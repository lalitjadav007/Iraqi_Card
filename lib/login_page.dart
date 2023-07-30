import 'dart:async';
import 'dart:convert';

import 'package:cards_store/home_screen.dart';
import 'package:cards_store/models/login_response.dart';
import 'package:cards_store/preferences/shared_preferences.dart';
import 'package:cards_store/resources/translation_keys.dart' as translations;
import 'package:cards_store/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'common_widgets.dart';
import 'controller/login_controller.dart';

class LoginPage extends StatefulWidget {
  static var name = "/login";

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var loginController = Get.put(LoginController());
  final TextEditingController usernameController =
  TextEditingController(text: "");
  final TextEditingController passwordController =
  TextEditingController(text: "");

  String? usernameError, passwordError;

  @override
  Widget build(BuildContext context) {
    ScaffoldMessengerState toast = ScaffoldMessenger.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16,),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const FlutterLogo(
                  size: 70,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 70, left: 10, right: 10),
                  child: buildTextField(
                    context,
                    label: translations.username.tr,
                    inputType: TextInputType.text,
                    imeAction: TextInputAction.next,
                    maxLength: 25,
                    errorText: usernameError,
                    controller: usernameController,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
                  child: buildTextField(
                    context,
                    label: translations.password.tr,
                    inputType: TextInputType.visiblePassword,
                    maxLength: 25,
                    errorText: passwordError,
                    imeAction: TextInputAction.done,
                    controller: passwordController,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10, left: 10, right: 20),
                  child: Row(
                    children: [
                      const Spacer(),
                      GestureDetector(
                        child: const Text("Forgot password?"),
                        onTap: () {},
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child:
                  buildButton(context, translations.buttonLogin.tr, () async {
                    setState(() {
                      _usernameErrorText != null
                          ? usernameError = _usernameErrorText
                          : usernameError = null;
                      return;
                    });
                    setState(() {
                      _passwordErrorText != null
                          ? passwordError = _passwordErrorText
                          : passwordError = null;
                      return;
                    });

                    if (_usernameErrorText == null &&
                        _passwordErrorText == null) {
                      print("Valid");
                      FocusScope.of(context).unfocus();

                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (BuildContext context) {
                          return getLoadingDialog();
                        },
                      );

                      AuthResponse? response = await loginController.loginUser(
                          usernameController.text.toString(),
                          passwordController.text.toString());

                      Get.back();

                      if (response != null) {
                        saveLoginUser(jsonEncode(response.toJson()));
                        if (response.message?.error?.isNotEmpty == true) {
                          //Failed
                          toast.showSnackBar(SnackBar(
                            content: Text(response.message?.error?[0] ?? ""),
                          ));
                        } else {
                          Get.toNamed(HomeScreen.name);
                        }
                      }
                    }
                  }),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(const SignupPage());
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      translations.createAccount.tr,
                      style: Theme
                          .of(context)
                          .textTheme
                          .bodyMedium,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String? get _usernameErrorText {
    final value = usernameController.value.text;
    if (value.isEmpty == true) {
      return translations.emptyUsernameValidation.tr;
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
}
