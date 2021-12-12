import 'package:flutter/material.dart';
import 'dart:math';
import 'package:lottie/lottie.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(
    MaterialApp(
        home: SplashScreen(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          primaryColor: Color(0xff0a0e21),
          scaffoldBackgroundColor: Color(0xff0a0e21),
        )),
  );
}

enum Gender { male, female }

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
              child: Row(
                children: [
                  Expanded(
                    child: ReuseableCard(
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

class ReuseableCard extends StatelessWidget {
  ReuseableCard({@required this.colour, this.cardChild, this.onPressed});

  final Color colour;
  final Widget cardChild;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: colour,
        ),
      ),
    );
  }
}

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

class NavigationBotton extends StatelessWidget {
  NavigationBotton({@required this.text, @required this.onPressed});
  final String text;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        child: Center(
          child: Text(
            text,
            style: kBottomTextStyle,
          ),
        ),
        padding: EdgeInsets.only(bottom: 5),
        width: double.infinity,
        height: kBottomContainerHieght,
        color: kBottomContainerColor,
      ),
    );
  }
}

class CardChild extends StatelessWidget {
  CardChild({@required this.titleText, this.titleIcon});

  final String titleText;
  final IconData titleIcon;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            titleIcon,
            size: 60,
//            color: kBottomContainerColor,
          ),
          SizedBox(
            height: 15,
          ),
          Text(titleText, style: kNormalTextStyle),
        ],
      ),
    );
  }
}

class RoundedButton extends StatelessWidget {
  RoundedButton({this.icon, this.process});
  final IconData icon;
  final Function process;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        child: Icon(icon),
        onPressed: process,
        elevation: 6.0,
        fillColor: Color(0xff505080)  , //4c4f5e
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        constraints: BoxConstraints.tightFor(
          width: 56.0,
          height: 56.0,
        ));
  }
}

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


const kBottomContainerHieght = 50.0;

const kActiveCardColor = Color(0xff505080); //1d1e33  183f52
const kInactiveCardColor = Color(0x0ff111328); //#181818  111328
const kBottomContainerColor = Color(0xffFF5396); // FF5CB8   eb1555 ef4f7f

const kNormalTextStyle = TextStyle(fontSize: 18, color: Color(0xff8d8e98));
const kNumberTextStyle = TextStyle(fontSize: 50, fontWeight: FontWeight.w900);
const kBottomTextStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
const kResultTextStyle = TextStyle(
  fontSize: 30.0,
  color: Colors.orange,
  fontWeight: FontWeight.bold,
);
const kBmiTextStyle =
    TextStyle(fontSize: 80, color: Colors.white, fontWeight: FontWeight.bold);

//Color(0xff24d876)
