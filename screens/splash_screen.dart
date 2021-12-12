import 'dart:async';

import '/home/kalpeshk/Desktop/Android flutter/ANDROID/FltterVSCode/bmi_calculator/utilites/constant.dart';
import '/home/kalpeshk/Desktop/Android flutter/ANDROID/FltterVSCode/bmi_calculator/screens/input_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "BMI CALCULATOR",
          style: kNumberTextStyle,
          textAlign: TextAlign.center,
        ),
        Lottie.asset("assets/doctor.json", onLoaded: (a) async {
          await Future.delayed(Duration(milliseconds: 5003));
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return InputPage();
          }));
        }),
        Text(
          "GeopGeek\n Kalpesh",
          style: kBottomTextStyle,
          textAlign: TextAlign.center,
        ),
      ],
    )));
  }
}
