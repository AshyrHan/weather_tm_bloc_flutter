import 'package:equatable/equatable.dart';

class WeatherModel extends Equatable {
  final double temp;
  final int isDay;
  final double feelsLike;

  WeatherModel({this.temp, this.isDay, this.feelsLike});

  static WeatherModel fromJson(dynamic json) {
    return WeatherModel(
      temp: json['temp_c'],
      isDay: json['is_day'],
      feelsLike: json['feelslike_c'],
    );
  }

  @override
  List<Object> get props => [temp, isDay, feelsLike];
}
