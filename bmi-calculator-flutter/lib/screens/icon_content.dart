import 'package:flutter/material.dart';
import '../constants.dart';

class IconContent extends StatelessWidget {

  final String gender;
  final IconData genderIcon;
  IconContent({@required this.genderIcon,@required this.gender});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          genderIcon,
          //FontAwesomeIcons.mars,
          size: 50.0,
        ),
        SizedBox(
          height: 4.0,
        ),
        Text(
          gender,
          style:kLabelTextStyle,
        ),
      ],
    );
  }
}