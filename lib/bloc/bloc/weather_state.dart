part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class Weatherinitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherRegionChoosed extends WeatherState {
  final String regionName;
  final Map map;
  final String svgName;

  WeatherRegionChoosed({this.regionName, this.map, this.svgName});
}

class WeatherLoaded extends WeatherState {
  final WeatherCurrentModel weatherModel;
  final String nameCity;

  WeatherLoaded({@required this.weatherModel, this.nameCity})
      : assert(weatherModel != null);
}

class WeatherError extends WeatherState {}
