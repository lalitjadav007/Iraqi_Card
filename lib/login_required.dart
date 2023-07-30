import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
          Text(
            'Login Required',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ],
      ),
    );
  }

}