import 'dart:async';

import 'package:cards_store/home_screen.dart';
import 'package:cards_store/models/login_response.dart';
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
      appBar: AppBar(
        title: const Text("Login"),
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/images/app_image.png"),
            Container(
              margin: const EdgeInsets.only(top: 70, left: 10, right: 10),
              child: buildTextField(
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
            buildButton(context, translations.buttonLogin.tr, () async {
              setState(() {
                _usernameErrorText != null ? usernameError = _usernameErrorText : usernameError = null;
                return;
              });
              setState(() {
                _passwordErrorText != null ? passwordError = _passwordErrorText : passwordError = null;
                return;
              });

              if (_usernameErrorText == null && _passwordErrorText == null) {
                print("Valid");
                FocusScope.of(context).unfocus();

                AlertDialog alert = AlertDialog(
                  content: Row(children: [
                    const CircularProgressIndicator(
                      backgroundColor: Colors.red,
                    ),
                    Container(margin: const EdgeInsets.only(left: 7), child: const Text("Loading...")),
                  ]),
                );
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (BuildContext context) {
                    return alert;
                  },
                );

                AuthResponse? response = await loginController.loginUser(
                    usernameController.text.toString(),
                    passwordController.text.toString());
                Navigator.pop(context);
                if (response != null) {
                  toast.showSnackBar(SnackBar(
                    content: Text(response.message?.success?[0] ?? ""),
                  ));
                  Timer(const Duration(seconds: 2), () {
                    Get.to(const HomeScreen());
                  });

                }
              }
            }),
            Container(
              margin: const EdgeInsets.only(top: 20, left: 10, right: 20),
              child: GestureDetector(
                child: const Text(
                  "Create account",
                  style: TextStyle(fontSize: 18),
                ),
                onTap: () {
                  Get.to(const SignupPage());
                },
              ),
            ),
          ],
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
