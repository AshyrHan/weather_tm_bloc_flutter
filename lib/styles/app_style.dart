import 'package:flutter/cupertino.dart';
import 'package:hexcolor/hexcolor.dart';

class Style {
  static final primaryColor = HexColor('2E3442');

  static final primaryFont = 'Poppins-Light';

  static cityNameStyle() {
    return TextStyle(
      color: primaryColor,
      fontFamily: primaryFont,
      height: 1.0,
      fontSize: 50.0,
    );
  }

  static stateNameStyle() {
    return TextStyle(
      color: primaryColor,
      fontFamily: 'Montserrat-Regular',
      fontSize: 28.0,
    );
  }

  static currentDegreeStyle() {
    return TextStyle(
      color: primaryColor,
      fontFamily: primaryFont,
      height: 1.0,
      fontSize: 43.0,
    );
  }

  static conditionNameStyle() {
    return TextStyle(
      color: primaryColor,
      fontFamily: 'Montserrat-Regular',
      fontSize: 22.0,
    );
  }

  static meteoInfoStyle() {
    return TextStyle(
      color: primaryColor,
      fontFamily: primaryFont,
      fontSize: 10.0,
    );
  }

  static primarytextStyle() {
    return TextStyle(
      color: primaryColor,
      fontFamily: primaryFont,
      fontSize: 14.0,
    );
  }
}
