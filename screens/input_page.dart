import '../screens/result.dart';
import '../models/reusable_cards.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../bmiCalculator/Brain.dart';
import '../utilites/constant.dart';
import '../models/navigationButton.dart';
import '../models/card_child.dart';
import '../models/button.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int userHeight = 150;
  int userWeight = 60;
  int age = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("BMI CALCULATOR"),
          centerTitle: true,
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                accountEmail: Text(
                  "geopgeek@gmail.com",
                  style: kNormalTextStyle,
                ),
                accountName: Text(
                  "GeopGeek Developer",
                  style: kNormalTextStyle,
                ),
              ),
            ],
          ),
          elevation: 5,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: ReuseableCard(
                    onPressed: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: CardChild(
                      titleText: "MALE",
                      titleIcon: FontAwesomeIcons.male,
                    ),
                  )),
                  Expanded(
                    child: ReuseableCard(
                        onPressed: () {
                          setState(() {
                            selectedGender = Gender.female;
                          });
                        },
                        colour: selectedGender == Gender.female
                            ? kActiveCardColor
                            : kInactiveCardColor,
                        cardChild: CardChild(
                          titleText: "FEMALE",
                          titleIcon: FontAwesomeIcons.female,
                        )),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReuseableCard(
                colour: kInactiveCardColor,
                cardChild: Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "HEIGHT ",
                      style: kNormalTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          userHeight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Text(
                          "cm",
                          style: kNormalTextStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 10),
                          activeTrackColor: Color(0xff505080),
                          inactiveTickMarkColor: Color(0xff8d8e98),
                          thumbColor: Color(0xffeb1555),
                          overlayColor: Color(0x35eb1555),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 20),
                          trackHeight: 3),
                      child: Slider(
                          value: userHeight.toDouble(),
                          min: 40.0,
                          max: 250.0,
                          onChanged: (userValue) {
                            setState(() {
                              userHeight = userValue.toInt();
                              print(userHeight);
                            });
                          }),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child:
               Row(
                children: [
                  Expanded(
                    child:
                      ReuseableCard(
                        colour: kInactiveCardColor,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "WEIGHT ",
                              style: kNormalTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text(
                                  userWeight.toString(),
                                  style: kNumberTextStyle,
                                ),
                                Text(
                                  "Kg",
                                  style: kNormalTextStyle,
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundedButton(
                                  process: () {
                                    setState(() {
                                      userWeight--;

                                      print(userWeight);
                                    });
                                  },
                                  icon: FontAwesomeIcons.minus,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                RoundedButton(
                                  process: () {
                                    setState(() {
                                      userWeight++;

                                      print(userWeight);
                                    });
                                  },
                                  icon: FontAwesomeIcons.plus,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    
                  ),
                  Expanded(
                      child: ReuseableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "AGE",
                          style: kNormalTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundedButton(
                              process: () {
                                setState(() {
                                  age--;
                                });
                              },
                              icon: FontAwesomeIcons.minus,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundedButton(
                              process: () {
                                setState(() {
                                  age++;
                                });
                              },
                              icon: FontAwesomeIcons.plus,
                            )
                          ],
                        )
                      ],
                    ),
                    colour: kInactiveCardColor,
                  )),
                ],
              ),
            ),
            NavigationBotton(
              text: "Calculate",
              onPressed: () {
                BrainBmi cal = BrainBmi(height: userHeight, weight: userWeight);
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ResultPage(
                    bmiValue: cal.calValue(),
                    advice: cal.getAdvice(),
                    bmiResult: cal.getResult(),
                    /*animation: cal.getAnimation(),*/
                  );
                }));
              },
            )
          ],
        ));
  }
}
