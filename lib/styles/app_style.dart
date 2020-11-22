import 'package:flutter/cupertino.dart';
import 'package:hexcolor/hexcolor.dart';

class Style {
  static final primaryColor = HexColor('2E3442');

  static const primaryFont = 'Poppins-Light';

  static TextStyle cityNameStyle() {
    return TextStyle(
      color: primaryColor,
      fontFamily: primaryFont,
      height: 1.0,
      fontSize: 50.0,
    );
  }

  static TextStyle stateNameStyle() {
    return TextStyle(
      color: primaryColor,
      fontFamily: 'Montserrat-Regular',
      fontSize: 28.0,
    );
  }

  static TextStyle currentDegreeStyle() {
    return TextStyle(
      color: primaryColor,
      fontFamily: primaryFont,
      height: 1.0,
      fontSize: 43.0,
    );
  }

  static TextStyle conditionNameStyle() {
    return TextStyle(
      color: primaryColor,
      fontFamily: 'Montserrat-Regular',
      fontSize: 22.0,
    );
  }

  static TextStyle meteoInfoStyle() {
    return TextStyle(
      color: primaryColor,
      fontFamily: primaryFont,
      fontSize: 12.0,
    );
  }

  static TextStyle primarytextStyle() {
    return TextStyle(
      color: primaryColor,
      fontFamily: primaryFont,
      fontSize: 14.0,
    );
  }
}
