part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class FetchWeather extends WeatherEvent {
  final String cityName;
  final String latlan;

  FetchWeather({@required this.latlan, this.cityName}) : assert(latlan != null);
}

class ChooseCity extends WeatherEvent {
  final String regionName;
  final Map map;
  final String svgName;

  ChooseCity(
      {@required this.regionName, @required this.map, @required this.svgName});
}

class RefreshWeather extends WeatherEvent {}

class ToInitial extends WeatherEvent {}
