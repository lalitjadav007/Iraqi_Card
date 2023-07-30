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
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
            ),
            Text(
              "Want to buy card?",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              "We has cards of your interest",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Flexible(
              child: Image.asset("assets/images/info_page.png"),
              flex: 5,
            ),
            Spacer(flex: 1),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Get.offAndToNamed(LoginPage.name);
                      },
                      child: Text("Sign In"),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Get.offAndToNamed(HomeScreen.name);
                      },
                      child: Text("Get Started"),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.deepPurple,
                        backgroundColor: Colors.white70,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
