import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';

class BrainBmi {
  BrainBmi({@required this.height, @required this.weight});

  final int weight;
  final int height;
  double _bmi;

  String calValue() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(2);
  }

  String getResult() {
    if (_bmi > 39.9)
      return "morbidly obese weight";
    else if (_bmi >= 29.9)
      return "obese weight";
    else if (_bmi > 25 && _bmi < 29.9)
      return "Over weight";
    else if (_bmi >= 18.5 && _bmi <= 24.9)
      return "Healthy Weight";
    else if (_bmi < 18.5) return "Under Weight";
  }

  String getAdvice() {
    if (_bmi > 39.9)
      return "Seek Supervision...";
    else if (_bmi >= 29.9 && _bmi <= 39.9)
      return "Eat three meals per day, not five or six small ones....";
    else if (_bmi > 25 && _bmi < 29.9)
      return "Take up activities such as fast walking, jogging, swimming or tennis for 2.5 to 5 hours a week.";
    else if (_bmi >= 18.5 && _bmi <= 24.9)
      return "Eat 5 servings of fruits and veggies a day. Fruits and veggies are about more than just vitamins and minerals...";
    else if (_bmi < 18.5)
      return "Eat more frequently. When you're underweight, you may feel full faster....";
  }

//  String getAnimation() {
//    if (_bmi > 39.9)
//      return "assets/5.json";
//    else if (_bmi >= 29.9 && _bmi <= 39.9)
//      return "assets/4.json";
//     else if (_bmi >= 24.9 && _bmi < 29.9)
//      return "assets/3.json";
//     else if (_bmi >= 18.5 && _bmi < 24.9)
//      return "assets/2.json";
//    else if (_bmi < 18.5)
//      return "assets/1.json";
//  }
}
