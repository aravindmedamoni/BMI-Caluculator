import 'package:flutter/material.dart';
import 'package:bmi_calculator/Constatns.dart';

class BottomNavigatorButton extends StatelessWidget {

  BottomNavigatorButton({@required this.onPressed, @required this.buttonName});

  final Function onPressed;
  final String buttonName;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        child: Center(
          child: Text(
            buttonName,
            style: TextStyle(
                fontSize: 25
            ),
          ),
        ),

        margin: EdgeInsets.all(2),
        decoration: BoxDecoration(
            color: kBottomContainerColor,
            borderRadius: BorderRadius.circular(10)
        ),
        width: double.infinity,
        height: kBottomContainerHeight,
      ),
    );
  }
}
