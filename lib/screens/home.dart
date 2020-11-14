import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:weather_tm_bloc/bloc/bloc/weather_bloc.dart';
import 'package:weather_tm_bloc/const.dart';
import 'package:weather_tm_bloc/repository/weather-repo.dart';
import 'package:weather_tm_bloc/screens/weather_ui.dart';

class Home extends StatelessWidget {
//  final weatherRepository = WeatherRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WeatherBloc>(
        create: (context) =>
            WeatherBloc(weatherRepository: WeatherRepository()),
        child: Scaffold(
            backgroundColor: HexColor('ffffff'),
            body: BlocBuilder<WeatherBloc, WeatherState>(
              builder: (context, state) {
                if (state is Weatherinitial) {
                  return WeatherUI();
                }
                if (state is WeatherLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is WeatherLoaded) {
                  return Center(
                    child: Column(
                      children: [
                        Container(
                          child: Text(state.weatherModel.temp.toString()),
                        ),
                        Container(
                          child: Text(state.weatherModel.isDay.toString()),
                        )
                      ],
                    ),
                  );
                }
                return Text('Error');
              },
            )));
  }
}

class ButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final WeatherBloc bloc = BlocProvider.of<WeatherBloc>(context);
    return Center(
      child: IconButton(
          icon: Icon(Icons.get_app),
          onPressed: () {
            bloc.add(FetchWeather(latlan: maryCity));
          }),
    );
  }
}
