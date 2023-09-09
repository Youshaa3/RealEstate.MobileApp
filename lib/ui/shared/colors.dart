import 'package:flutter/material.dart';

class AppColors
{
  static Color mainGreenColor = Colors.teal;
  static Color mainWhiteColor = Color.fromRGBO(252, 255, 255, 1);
  static Color transparentColor = Color.fromRGBO(255, 255, 255, 0);
  static Color mainBlueColor = Color.fromRGBO(54, 127, 192, 1);
  static Color mainRedColor = Color.fromRGBO(221, 75, 57, 1);
  static Color textFieldColor = Color.fromRGBO(242, 242, 242, 1);
  static Color textColorForTextField = Color.fromRGBO(182, 183, 183, 1);
  static Color mainTextColor2 = Color.fromRGBO(124, 125, 126, 1);
  static Color mainTextColor1 = Color.fromRGBO(74, 75, 77, 1);
}



// our default Shadow
const kDefaultShadow = BoxShadow(
  offset: Offset(0, 15),
  blurRadius: 27,
  color: Colors.black12, // Black color with 12% opacity
);