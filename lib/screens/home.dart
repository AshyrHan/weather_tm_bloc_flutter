import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_tm_bloc/bloc/bloc/weather_bloc.dart';

import 'package:weather_tm_bloc/repository/weather-repo.dart';

import 'package:weather_tm_bloc/screens/map.dart';
import 'package:weather_tm_bloc/screens/weather_ui.dart';
import 'package:weather_tm_bloc/styles/app_style.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<WeatherBloc>(
      create: (context) => WeatherBloc(weatherRepository: WeatherRepository()),
      child: Scaffold(
        backgroundColor: Style.bgColor,
        body: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            if (state is Weatherinitial) {
              return MapTm();
            }
            if (state is WeatherLoaded) {
              return WeatherUI();
            }
            if (state is WeatherLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Container(
                child: Text('Error'),
              );
            }
          },
        ),
      ),
    );
  }
}
