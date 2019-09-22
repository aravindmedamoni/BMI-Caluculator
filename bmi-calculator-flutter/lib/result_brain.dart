import 'dart:math';

class ResultBrain{
  final int weight;
  final int height;

  ResultBrain({this.weight, this.height});

  double _bmi;

  String calculateBMI(){
    _bmi = weight/pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getText(){
    if(_bmi>=25){
      return 'Overweight';
    }else if(_bmi>=18.5){
      return 'Normal';
    }else{
      return 'Underweight';
    }
  }

  String getInterpretation(){
    if(_bmi>=25){
      return 'You have a higher than normal body weight. try to exercise more.';
    }else if(_bmi>=18.5){
      return 'You  have a good normal body weight. Good job!';
    }else{
      return 'you have a lower than normal body weight. You can eat bit more.';
    }
  }
}