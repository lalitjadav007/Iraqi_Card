import 'package:cards_store/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginRequired extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 25,
          ),
          Image.asset('assets/images/login_needed.png'),
          SizedBox(
            height: 25,
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed(LoginPage.name);
            },
            child: Text(
              'Login Required',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
        ],
      ),
    );
  }

}