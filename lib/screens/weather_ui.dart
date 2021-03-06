import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:weather_tm_bloc/bloc/bloc/weather_bloc.dart';
import 'package:weather_tm_bloc/models/weather_model.dart';

import 'package:weather_tm_bloc/widgets/current_weather.dart';
import 'package:weather_tm_bloc/widgets/drawer.dart';
import 'package:weather_tm_bloc/widgets/more_info.dart';
import 'package:weather_tm_bloc/widgets/widgets.dart';
import 'package:weather_tm_bloc/widgets/daily_forecast.dart';

class WeatherUI extends StatefulWidget {
  @override
  _WeatherUIState createState() => _WeatherUIState();
}

class _WeatherUIState extends State<WeatherUI> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  bool _isDay;

  isDay() {
    (DateTime.now().hour > 6 && DateTime.now().hour < 19)
        ? _isDay = true
        : _isDay = false;
  }

  @override
  void initState() {
    isDay();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      drawer: DrawerWidget(),
      backgroundColor: _isDay ? HexColor('E5ECF4') : HexColor('313745'),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            if (state is WeatherLoaded) {
              WeatherCurrentModel _model = state.weatherModel;
              String a = state.nameCity;
              return Column(
                children: [
                  customAppBar(context, _drawerKey),
                  cityNameWidget(context, a),
                  weatherIcon(
                    context,
                    _model.current.condition.code,
                  ),
                  CurrentWeather(
                    model: _model,
                  ),
                  hourWeather(context, _model),
                  Divider(),
                  DailyForecast(
                    model: _model,
                  ),
                  //  Divider(),
                  MoreInfo(
                    model: _model,
                  ),
                ],
              );
            } else if (state is WeatherError) {
              return ErrorPage();
            } else if (state is WeatherLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ErrorPage();
            }
          },
        ),
      ),
    );
  }
}

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Error'),
      ),
    );
  }
}
