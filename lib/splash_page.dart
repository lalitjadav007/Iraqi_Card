import 'dart:async';

import 'package:cards_store/home_screen.dart';
import 'package:cards_store/login_page.dart';
import 'package:cards_store/preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatefulWidget {
  static var name = "/splash";

  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3), () {
      if (getLoginUser() != null) {
        Get.offAndToNamed(HomeScreen.name);
      } else {
        Get.offAndToNamed(LoginPage.name);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: FlutterLogo(
          size: MediaQuery.of(context).size.width / 2,
        ),
      ),
    );
  }
}
