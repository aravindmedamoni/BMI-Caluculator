import 'package:flutter/material.dart';
import 'package:bmi_calculator/Constatns.dart';


class RoundedIconButton extends StatelessWidget {
  RoundedIconButton({@required this.icon, @required this.onPressed});
  final IconData icon;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child:Icon(icon) ,
      onPressed: onPressed,
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      fillColor: Color(0xFF4c4f5e),
    );
  }
}