import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:weather_tm_bloc/models/weather_model.dart';
import 'package:weather_tm_bloc/repository/weather-repo.dart';
part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends HydratedBloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;
  WeatherBloc({this.weatherRepository}) : super(Weatherinitial());

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    if (event is FetchWeather) {
      yield WeatherLoading();
      Hive.box('cityName').put('city', event.cityName);
      try {
        WeatherCurrentModel weatherModel =
            await weatherRepository.getWeather(event.latlan);

        yield WeatherLoaded(
            weatherModel: weatherModel, nameCity: event.cityName);
      } catch (_) {
        yield WeatherError();
      }
    } else {
      yield WeatherError();
    }

    if (event is ToInitial) {
      yield Weatherinitial();
    }

    if (event is ChooseCity) {
      yield WeatherRegionChoosed(
        map: event.map,
        regionName: event.regionName,
        svgName: event.svgName,
      );
    }
  }

  @override
  WeatherState fromJson(Map<String, dynamic> json) {
    try {
      final weather = WeatherCurrentModel.fromJson(json);
      final cityName = Hive.box('cityName').get('city');

      return WeatherLoaded(
        weatherModel: weather,
        nameCity: cityName,
      );
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic> toJson(WeatherState state) {
    if (state is WeatherLoaded) {
      return state.weatherModel.toJson();
    } else {
      return null;
    }
  }
}
