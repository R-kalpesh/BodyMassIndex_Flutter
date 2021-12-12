import 'package:flutter/material.dart';

import '../utilites/constant.dart';

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
