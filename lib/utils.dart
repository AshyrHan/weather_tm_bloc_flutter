import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:weather_tm_bloc/styles/app_style.dart';

class Utils {
  static String dateFormatHour(String time) {
    final parsedTime = DateTime.parse(time);
    final format = DateFormat.HOUR24_MINUTE;
    return DateFormat(format).format(parsedTime);
  }

  static String dateFormatMonth(String time) {
    final parsedTime = DateTime.parse(time);
    final format = DateFormat('d');

    String month;
    switch (parsedTime.month) {
      case 1:
        month = "ýanwar";
        break;
      case 2:
        month = "fewral";
        break;
      case 3:
        month = "mart";
        break;
      case 4:
        month = "aprel";
        break;
      case 5:
        month = "maý";
        break;
      case 6:
        month = "iýun";
        break;
      case 7:
        month = "iýul";
        break;
      case 8:
        month = "awgust";
        break;
      case 9:
        month = "sentýabr";
        break;
      case 10:
        month = "oktýabr";
        break;
      case 11:
        month = "noýabr";
        break;
      case 12:
        month = "dekabr";
        break;
    }

    return '${format.format(parsedTime)}-$month';
  }

  static String dateFormatDay(jsonTime) {
    DateTime time = DateTime.parse(jsonTime);

    dynamic dayData =
        '{ "1" : "Duşenbe", "2" : "Sişenbe",  "3" : "Çarşenbe", "4" : "Penşenbe", "5" : "Anna", "6" : "Şenbe", "7" : "Ýekşenbe"}';

    return json.decode(dayData)['${time.weekday}'];
  }

  static bool isHoliday(jsonTime) {
    DateTime time = DateTime.parse(jsonTime);

    if (time.weekday == 6 || time.weekday == 7) {
      return true;
    } else {
      return false;
    }
  }

  static String formatTemp(double tempC) {
    if (!tempC.isNegative) {
      return '+${tempC.round().toString()}°';
    } else {
      return '${tempC?.round().toString()}°';
    }
  }

  static codeToImage(int code, String time) {
    //bool _isNight;

    bool isDay(String time) {
      // print(time);
      if (time == 'daily') {
        return true;
      } else {
        final parsedTime = DateTime.parse(time);
        if (parsedTime.hour > 6 && parsedTime.hour < 19) {
          return true;
        } else {
          return false;
        }
      }
    }

    //String month;
    switch (code) {
      case 1000:
        return isDay(time)
            ? Image.asset('assets/images/sunny.png')
            : Image.asset('assets/images/clearNight.png'); // солнечно, ясно
        break;
      case 1003:
        return isDay(time)
            ? Image.asset(
                'assets/images/partyCloudly.png') // Переменная облачность partyCloudly.png
            : Image.asset('assets/images/partyCloudlyNight.png');
        break;
      case 1006:
      case 1009:
        return Image.asset('assets/images/cloudly.png');
        // return isDay(time)
        //     ? Image.asset('assets/images/cloudly.png')
        //     : Image.asset('assets/images/partyCloudlyNight.png');
        // return SvgPicture.asset('assets/images/cloudly.svg'); // Облачно
        break;
      case 1030:
        return SvgPicture.asset('assets/images/haze.svg'); // Дымка
        break;

      case 1066:
      case 1210:
      case 1213:
      case 1216:
      case 1219:
      case 1222:
      case 1225:
      case 1255:
      case 1114:
      case 1258:
      case 1117:
        return Image.asset('assets/images/snow.png'); // снег
        break;
      case 1135:
      case 1147:
        return SvgPicture.asset('assets/images/fog.svg'); // Туман
        break;
      case 1150:
      case 1072:
      case 1153:
      case 1168:
      case 1171:
      case 1180:
      case 1183:
      case 1183:
      case 1186:
      case 1189:
      case 1192:
      case 1195:
      case 1198:
      case 1201:
      case 1204:
      case 1207:
      case 1240:
      case 1243:
      case 1246:
      case 1249:
      case 1252:
      case 1069:
      case 1063:
        return Image.asset('assets/images/rain.png'); //  дождь
        break;
      case 1237:
      case 1261:
      case 1264:
        return Image.asset('assets/images/freeze.png'); // леденой дождь
        break;
      case 1273:
      case 1276:
      case 1279:
      case 1282:
      case 1087:
        return Image.asset('assets/images/thunder.png'); // грозa
        break;
      default:
    }

    return Image.asset('assets/images/sunny.png');
  }

  static codeToMainImage(int code, DateTime time) {
    bool isNight;

    (time.hour > 6 && time.hour < 19) ? isNight = false : isNight = true;

    //String month;
    switch (code) {
      case 1000:
        return isNight
            ? Image.asset(
                'assets/images/mainClearNight.png',
                color: Style.primaryColor,
              )
            : SvgPicture.asset(
                'assets/images/mainSunny.svg',
              ); // солнечно, ясно
        break;
      case 1003:
        return isNight
            ? SvgPicture.asset(
                'assets/images/mainPartyCloudNight.svg',
                color: Style.primaryColor,
              )
            : Image.asset(
                'assets/images/mainPartyCloud.png',
              ); // Переменная облачность
        break;
      case 1006:
      case 1009:
        return Image.asset('assets/images/mainCloud.png'); // Облачно
        break;
      case 1030:
        return SvgPicture.asset('assets/images/mainHaze.svg'); // Дымка
        break;

      case 1066:
      case 1210:
      case 1213:
      case 1216:
      case 1219:
      case 1222:
      case 1225:
      case 1255:
      case 1114:
      case 1258:
      case 1117:
        return Image.asset('assets/images/mainSnow.svg'); // снег
        break;
      case 1135:
      case 1147:
        return SvgPicture.asset('assets/images/mainFog.svg'); // Туман
        break;
      case 1150:
      case 1072:
      case 1153:
      case 1168:
      case 1171:
      case 1180:
      case 1183:
      case 1183:
      case 1186:
      case 1189:
      case 1192:
      case 1195:
      case 1198:
      case 1201:
      case 1204:
      case 1207:
      case 1240:
      case 1243:
      case 1246:
      case 1249:
      case 1252:
      case 1069:
      case 1063:
        return Image.asset('assets/images/mainRain.svg'); //  дождь
        break;
      case 1237:
      case 1261:
      case 1264:
        return Image.asset('assets/images/mainFreeze.svg'); // леденой дождь
        break;
      case 1273:
      case 1276:
      case 1279:
      case 1282:
      case 1087:
        return Image.asset('assets/images/mainThunder.png'); // грозa
        break;
      default:
    }

    return SvgPicture.asset(
      'assets/images/mainSunny.svg',
    );
  }

  static double windDirection(String direction) {
    print(direction);
    switch (direction) {
      case 'N':
        return (1 / 360);
        break;
      case 'NNE':
      case 'NE':
      case 'ENE':
        return (45 / 360);
        break;
      case 'E':
        return (90 / 360);
        break;
      case 'ESE':
      case 'SE':
      case 'SSE':
        return (135 / 360);
        break;
      case 'S':
        return (180 / 360);
        break;
      case 'SSW':
      case 'SW':
      case 'WSW':
        return (225 / 360);
        break;
      case 'W':
        return (275 / 360);
        break;
      case 'WNW':
      case 'NW':
      case 'NNW':
        return (315 / 360);
        break;
      default:
        return (1 / 360);
    }
  }
}
