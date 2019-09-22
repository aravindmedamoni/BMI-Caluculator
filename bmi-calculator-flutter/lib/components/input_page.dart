import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../screens/reusable_card.dart';
import '../screens/icon_content.dart';
import '../constants.dart';
import 'results_screen.dart';
import '../screens/bottom_button.dart';
import '../screens/round_icon_button.dart';
import 'package:bmi_calculator/result_brain.dart';
import 'package:toast/toast.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 120;
  int weight = 20;
  int age = 10;

//  Color maleCardColor = inactiveCardColor;
//  Color femaleCardColor = inactiveCardColor;
//
//  void updateCardColor(Gender selectedGender){
//    if(selectedGender == Gender.male){
//      if(maleCardColor == inactiveCardColor){
//        maleCardColor = activeCardColor;
//        femaleCardColor = inactiveCardColor;
//      }else{
//        maleCardColor = inactiveCardColor;
//      }
//    }else{
//      if(femaleCardColor == inactiveCardColor){
//        femaleCardColor = activeCardColor;
//        maleCardColor = inactiveCardColor;
//      }else{
//        femaleCardColor = activeCardColor;
//      }
//    }
//  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          //updateCardColor(Gender.male);
                          selectedGender = Gender.male;
                        });
                      },
                      colour: selectedGender == Gender.male
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: IconContent(
                        genderIcon: FontAwesomeIcons.mars,
                        gender: 'Male',
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          //updateCardColor(Gender.female);
                          selectedGender = Gender.female;
                        });
                      },
                      colour: selectedGender == Gender.female
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: IconContent(
                        genderIcon: FontAwesomeIcons.venus,
                        gender: 'Famale',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                colour: Color(0xFF86B4C9),
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'HEIGHT',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: kNumberTextStyle,
                        ),
                        SizedBox(
                          width: 3.0,
                        ),
                        Text(
                          'cm',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Colors.grey,
                        thumbColor: Colors.orange,
                        overlayColor: Color(0x29FF9800),
                        thumbShape: RoundSliderThumbShape(
                            enabledThumbRadius: 12.0),
                        overlayShape: RoundSliderOverlayShape(
                            overlayRadius: 25.0),
                      ),
                      child: Slider(value: height.toDouble(),
                        min: 80.0,
                        max: 220.0,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      colour: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Weight',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPress: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 4.0,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPress: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Age',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPress: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 4.0,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPress: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            BottomButton(buttonName: 'Calculate', onPress: () {

              if(selectedGender == Gender.male || selectedGender == Gender.female){
                ResultBrain resultBrain = ResultBrain(weight: weight,height: height);

                Navigator.push(context, MaterialPageRoute(builder: (context) =>
                    ResultScreen(
                      bmiResult: resultBrain.calculateBMI(),
                      resultText: resultBrain.getText(),
                      interpretation: resultBrain.getInterpretation(),
                    ),
                ),
                );
              }else {

                Toast.show("Please Select Gender", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.CENTER,backgroundColor: Colors.red);

              }
            },
            ),
          ],
        ));
  }
}


