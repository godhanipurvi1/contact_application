import 'dart:async';

import 'package:flutter/material.dart';

import '../sp/shareprefrance.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () async {
      MySharedPreferences my = MySharedPreferences();
      bool? isShow = await my.getShow();

      if (isShow == true) {
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        Navigator.pushReplacementNamed(context, '/intro');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(
        'lib/assets/img/sp.png',
        height: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
