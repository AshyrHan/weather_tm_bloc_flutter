import 'package:flutter/cupertino.dart';
import 'package:hexcolor/hexcolor.dart';

class Style {
  static bool isDay() {
    if (DateTime.now().hour > 6 && DateTime.now().hour < 19) {
      return true;
    } else {
      return false;
    }
  }

  static Color bgColor = isDay() ? HexColor('E5ECF4') : HexColor('313745');

  static Color primaryColor = isDay() ? HexColor('2E3442') : HexColor('E2E2E2');

  static const primaryFont = 'Poppins-Light';

  static TextStyle cityNameStyle() {
    return TextStyle(
      color: primaryColor,
      fontFamily: primaryFont,
      height: 1.0,
      fontSize: 40.0,
    );
  }

  static TextStyle stateNameStyle() {
    return TextStyle(
      color: primaryColor,
      fontFamily: 'Montserrat-Regular',
      fontSize: 18.0,
    );
  }

  static TextStyle currentDegreeStyle() {
    return TextStyle(
      color: primaryColor,
      fontFamily: primaryFont,
      height: 1.0,
      fontSize: 40.0,
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
