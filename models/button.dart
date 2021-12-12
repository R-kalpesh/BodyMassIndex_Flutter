import 'package:flutter/material.dart';

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
