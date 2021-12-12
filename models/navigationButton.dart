import 'package:flutter/material.dart';
import '../utilites/constant.dart';

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
