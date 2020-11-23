import 'package:flutter/material.dart';
import 'package:weather_tm_bloc/models/weather_model.dart';
import 'package:weather_tm_bloc/styles/app_style.dart';

import '../utils.dart';

class DailyForecast extends StatelessWidget {
  final WeatherCurrentModel model;

  DailyForecast({Key key, this.model}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: model.forecast.forecastday.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                child: dailyItem(context, index),
              ),
              Divider(
                  //color: Colors.black,
                  ),
            ],
          );
        },
      ),
    );
  }

  Widget dailyItem(BuildContext context, int index) {
    final size = MediaQuery.of(context).size;
    return Container(
      //   color: Colors.yellow,
      margin: EdgeInsets.symmetric(vertical: 2.0),
      width: size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: size.width * 0.40,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    Utils.dateFormatMonth(
                        model.forecast.forecastday[index].date),
                    // model.forecast.forecastday[index].date.toString(),
                    style: TextStyle(
                      color: Utils.isHoliday(
                              model.forecast.forecastday[index].date)
                          ? Colors.red
                          : Style.primaryColor,
                      fontFamily: Style.primaryFont,
                      fontSize: 10.0,
                    )),
                Text(
                  Utils.dateFormatDay(model.forecast.forecastday[index].date),
                  style: TextStyle(
                    color:
                        Utils.isHoliday(model.forecast.forecastday[index].date)
                            ? Colors.red
                            : Style.primaryColor,
                    fontFamily: Style.primaryFont,
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
          ),

          //

          Container(
            width: 50.0,
            height: 40.0,
            child: Padding(
                padding: EdgeInsets.all(1.0),
                child: Utils.codeToImage(
                    model.forecast.forecastday[index].day.condition.code,
                    'daily')),
          ),

          //

          Container(
            child: Text(
              Utils.formatTemp(model.forecast.forecastday[index].day.maxTemp),
              // model.forecast.forecastday[index].day.maxTemp.toString(),
              style: Style.primarytextStyle(),
            ),
          ),

          //

          Container(
            child: Text(
              Utils.formatTemp(model.forecast.forecastday[index].day.minTemp),
              style: Style.meteoInfoStyle(),
            ),
          ),
        ],
      ),
    );
  }
}
