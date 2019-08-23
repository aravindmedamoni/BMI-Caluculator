import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/ReusableCard.dart';
import 'package:bmi_calculator/components/ReusableCardDesign.dart';
import 'package:bmi_calculator/Constatns.dart';
import 'package:bmi_calculator/screens//Result_page.dart';
import 'package:bmi_calculator/components/Bottom_button.dart';
import 'package:bmi_calculator/components/RoundedIconButton.dart';
import 'package:bmi_calculator/CalculatorBrain.dart';
import 'package:fluttertoast/fluttertoast.dart';


enum Gender{
  male,
  female
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int height = 110;
  int weight = 25;
  int age =10;

  Gender selectedGender;
  // We can reduce below code by using Ternary operator.
//  Color maleColorCard = inactiveCardColor;
//  Color femaleCardColor = inactiveCardColor;
//
//  void colorUpdate(Gender genderType){
//    if(genderType == Gender.male){
//      if(maleColorCard == inactiveCardColor){
//        maleColorCard = Color(0xFF34495e);
//        femaleCardColor = inactiveCardColor;
//      }else{
//        maleColorCard = inactiveCardColor;
//      }
//    }else{
//      if(femaleCardColor == inactiveCardColor){
//        femaleCardColor = Color(0xFF34495e);
//        maleColorCard = inactiveCardColor;
//      }else {
//        femaleCardColor = inactiveCardColor;
//      }
//    }
//  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('BMI CALCULATOR',
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: (){
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour:  selectedGender == Gender.male ? kActiveCardColor: kInactiveCardColor,
                  cardChild: ReusableCardDesign(
                    iconData: FontAwesomeIcons.mars,
                    label: "MALE",
                  ),),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: (){
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour:  selectedGender == Gender.female ? kActiveCardColor : kInactiveCardColor,
                  cardChild: ReusableCardDesign(
                    iconData: FontAwesomeIcons.venus,
                    label: "FEMALE",
                  ),)
                )
              ],
            )),
            Expanded(child: ReusableCard(colour:  Colors.blueAccent[100],
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "HEIGHT",
                  style: kHeightTextStyle,
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
                      Text(
                          "cm",
                      style: kHeightTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Colors.white60,
                      thumbColor: Colors.amber,
                      overlayColor:  Color(0x29f39c12),
                      thumbShape:
                        RoundSliderThumbShape(enabledThumbRadius: 12.0),
                      overlayShape:
                        RoundSliderOverlayShape(overlayRadius: 28.0),
                    ),

                    child: Slider(
                      value: height.toDouble(),
                      min: 100.0,
                      max: 220.0,
                      onChanged: (double newValue){
                        setState(() {
                          height = newValue.toInt();
                        });
                      },
                    ),
                  ),
                ],
              ),
            )
            ),
            Expanded(child: Row(
              children: <Widget>[
                Expanded(
                  child:ReusableCard(
                      colour:  kInactiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                            "WEIGHT",
                          style: TextStyle(
                            color: Color(0xff8d8e98),
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundedIconButton(icon: FontAwesomeIcons.minus,
                              onPressed:(){
                              setState(() {
                                weight--;
                              });
                              },
                            ),
                            SizedBox(
                              width: 8.0,
                            ),
                            RoundedIconButton(icon: FontAwesomeIcons.plus,
                              onPressed: (){
                              setState(() {
                                weight++;
                              });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child:ReusableCard(colour:  kInactiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "AGE",
                          style: TextStyle(
                            color: Color(0xff8d8e98),
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundedIconButton(icon: FontAwesomeIcons.minus,
                              onPressed:(){
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 8.0,
                            ),
                            RoundedIconButton(icon: FontAwesomeIcons.plus,
                              onPressed: (){
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            )),
            BottomNavigatorButton(
              buttonName: "Calculate",
              onPressed: (){
                if (selectedGender == Gender.female || selectedGender == Gender.male){
                  CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => ResultPage(
                        getResult: calc.calculateBMI(),
                        getText: calc.getResult(),
                        getInterpretation: calc.getInterpretation(),

                      ),
                    ),
                  );
                }else {
                  Fluttertoast.showToast(
                    msg: "Please Select Gender",
                    toastLength: Toast.LENGTH_SHORT,
                    timeInSecForIos: 1,
                    fontSize: 16.0,
                    gravity: ToastGravity.TOP,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                  );
                }

              },
            )
          ],
        )
      ),
    );
  }
}



