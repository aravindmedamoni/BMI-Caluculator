import 'package:flutter/material.dart';
import 'package:bmi_calculator/Constatns.dart';

class ReusableCardDesign extends StatelessWidget {

  ReusableCardDesign({this.iconData,this.label});
  final IconData iconData;
  final String label;


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          iconData,
          size: 60,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          label,
          style:kLabelTextStyle)
      ],
    );
  }
}
