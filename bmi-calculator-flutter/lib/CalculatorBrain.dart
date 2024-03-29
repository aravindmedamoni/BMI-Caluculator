
import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({this.height, this.weight});

  final int height;
  final int weight;
  double _bmi;

  String calculateBMI(){
    _bmi = weight/pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult(){

    if(_bmi >=25){
      return "OverWeight";
    }else if(_bmi >18.5){
      return "Normal";
    }else {
      return "UnderWeight";
    }
  }

  String getInterpretation(){
    if(_bmi >=25){
      return "You have higher than normal body weight. Try to exercise more.";
    }else if(_bmi >18.5){
      return "You have Normal body Weight Keep it up.";
    }else {
      return "You have lower than normal body weight. You can eat bit more.";
    }
  }
}