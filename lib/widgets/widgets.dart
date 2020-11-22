import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hexcolor/hexcolor.dart';

import 'package:weather_tm_bloc/bloc/bloc/weather_bloc.dart';
import 'package:weather_tm_bloc/const.dart';
import 'package:weather_tm_bloc/models/weather_model.dart';
import 'package:weather_tm_bloc/styles/app_style.dart';
import '../utils.dart';

Widget customAppBar(BuildContext context, GlobalKey<ScaffoldState> key) {
  // ignore: close_sinks
  final weatherBloc = BlocProvider.of<WeatherBloc>(context);
  return SafeArea(
    child: Container(
      height: 30.0,
      //   color: Colors.red,
      child: Row(
        children: [
          IconButton(
              icon: Icon(
                Icons.menu,
                color: HexColor('2E3442'),
              ),
              onPressed: () {
                key.currentState.openDrawer();
              }),
          IconButton(
              icon: Icon(
                Icons.verified,
                color: HexColor('2E3442'),
              ),
              onPressed: () {
                weatherBloc.add(FetchWeather(latlan: maryCity));
              }),
        ],
      ),
    ),
  );
}

Widget cityNameWidget(BuildContext context, String cityName) {
  return Container(
    // color: Colors.amber,
    height: MediaQuery.of(context).size.height * 0.12,
    width: MediaQuery.of(context).size.width,
    child: Column(
      children: [
        Text(
          cityName ?? '',
          style: Style.cityNameStyle(),
        ),
        Text(
          'Turkmenistan',
          style: Style.stateNameStyle(),
        )
      ],
    ),
  );
}

Widget weatherIcon(BuildContext context, int code) {
  return Container(
      // color: Colors.lightBlue,
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width * 0.6,
      child: Container(
        child: Padding(
          padding: EdgeInsets.all(1.0),
          child: Utils.codeToMainImage(code),
        ),
      ));
}

Widget hourWeather(BuildContext context, WeatherCurrentModel model) {
  return Container(
    //  color: Colors.redAccent,
    height: 100,
    child: ListView(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      children: [
        const SizedBox(
          width: 20.0,
        ),
        ListView.builder(
          //physics: AlwaysScrollableScrollPhysics(),
          itemCount: model.forecast.forecastday.first.hour.length,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (
            context,
            index,
          ) {
            return hourWeatherWidget(index, model);
          },
        ),
      ],
    ),
  );
}

Widget hourWeatherWidget(int index, WeatherCurrentModel model) {
  return Container(
    margin: const EdgeInsets.only(right: 5.0),
    // color: Colors.amberAccent[200],
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 5.0),
          child: Text(
            Utils.dateFormatHour(
              model.forecast.forecastday.first.hour[index].time,
            ),
            // model.forecast.forecastday.first.hour[index].time,
            style: Style.meteoInfoStyle(),
          ),
        ),
        Container(
          height: 50.0,
          width: 60.0,
          child: Padding(
            padding: const EdgeInsets.all(1.0),
            child: Utils.codeToImage(
                model.forecast.forecastday.first.hour[index].condition.code),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: Text(
            Utils.formatTemp(
                model.forecast.forecastday.first.hour[index].tempC),
            style: Style.primarytextStyle(),
          ),
        ),
      ],
    ),
  );
}
