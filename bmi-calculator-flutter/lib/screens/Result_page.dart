import 'package:flutter/material.dart';
import 'package:bmi_calculator/Constatns.dart';
import 'package:bmi_calculator/components/ReusableCard.dart';
import 'package:bmi_calculator/components/Bottom_button.dart';


class ResultPage extends StatelessWidget {

  ResultPage({this.getResult, this.getText, this.getInterpretation});
  final String getText;
  final String getResult;
  final String getInterpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("BMI CALCULATOR",
            style: TextStyle(
              fontSize: 15,
            ),),
        ),
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
          child: Container(
            padding: EdgeInsets.all(15.0),
          alignment: Alignment.bottomLeft,
          child: Text(
        "Your Result",
        style:kTitleTextStyle,
      ),
      ),
      ),
          Expanded(
            flex: 5,
            child: ReusableCard(
                colour: kInactiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                      getText,
                    style: kResultTextStyle,
                  ),
                  Text(
                      getResult,
                    style: kBMITextStyle,
                  ),
                  Text(
                    getInterpretation,
                    textAlign: TextAlign.center,
                    style: kBodyTextStyle,
                  ),
                ],
              ),
            ),
          ),
          BottomNavigatorButton(
            buttonName: "Re-Calculate",
            onPressed: (){
              Navigator.pop(context);
            },
          ),
        ],
      )

    );
  }
}
