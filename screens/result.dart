import '../utilites/constant.dart';
import 'package:flutter/material.dart';
import '../models/reusable_cards.dart';
import 'package:lottie/lottie.dart';
import '../models/navigationButton.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {@required this.advice,
      @required this.bmiResult,
      @required this.bmiValue,
      /*@required this.animation*/});

  final String advice;
  final String bmiResult;
  final String bmiValue;
//  final String animation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("BMI RESULT"),
          centerTitle: true,
        ),
        body: Padding(
            padding: EdgeInsets.all(3),
            child: ReuseableCard(
              colour: kActiveCardColor,
              cardChild: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                  Text(
                      bmiResult.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: kResultTextStyle,
                    ),
                    Lottie.asset(
                      "assets/mediacal.json",
                      height: 150,
                      width: double.infinity,
                      repeat: true,
                    ),
                    Text(

                      bmiValue,
                      style: kBmiTextStyle,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      advice,
                      textAlign: TextAlign.center,
                      style: kResultTextStyle,
                    ),
                  ],
                ),
              ),
            )),
        bottomSheet: NavigationBotton(
          text: "Re-Calculate",
          onPressed: () {
            Navigator.pop(context);
          },

        ));
  }
}
