import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:weather_tm_bloc/widgets/widgets.dart';
import 'package:weather_tm_bloc/widgets/daily_forecast.dart';

class WeatherUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('E5ECF4'),
      // appBar: customAppBar(),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            customAppBar(),
            cityName(context),
            weatherIcon(context),
            currentWeather(context),
            hourWeather(context),
            DailyForecast()
          ],
        ),
      ),
    );
  }
}
