import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {

  final String buttonName;
  final Function onPress;

  BottomButton({@required this.buttonName, @required this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: kBottomContainerHeight,
        width: double.infinity,
        margin: EdgeInsets.all(6.0),
        child: Center(
          child: Text(
            buttonName,
            style: kBottomContainerTextStyle,
          ),
        ),
        decoration: BoxDecoration(
          color: kBottomContainerColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        //child: Text('Calculate'),
      ),
    );
  }
}