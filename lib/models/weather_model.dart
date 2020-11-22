import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weather_model.g.dart';

//#1
@JsonSerializable(explicitToJson: true)
class WeatherCurrentModel extends Equatable {
  final Forecast forecast;
  final Current current;

  WeatherCurrentModel({
    this.forecast,
    this.current,
  });

  factory WeatherCurrentModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherCurrentModelFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherCurrentModelToJson(this);

  @override
  List<Object> get props => [current];
}

//

@JsonSerializable(explicitToJson: true)
class Current extends Equatable {
  // ignore: non_constant_identifier_names
  final double temp_c;
  final int isDay;
  final Condition condition;
  final double windKph;
  final String windDir;
  final double pressureMb;
  final int humidity;
  final double feelslikeC;
  final double visKm;
  final double uv;

  Current(
      // ignore: non_constant_identifier_names
      {this.temp_c,
      this.isDay,
      this.condition,
      this.windKph,
      this.windDir,
      this.pressureMb,
      this.humidity,
      this.feelslikeC,
      this.visKm,
      this.uv});

  factory Current.fromJson(Map<String, dynamic> json) =>
      _$CurrentFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentToJson(this);

  @override
  List<Object> get props => [
        temp_c,
        isDay,
        windKph,
        windDir,
        pressureMb,
        humidity,
        feelslikeC,
        visKm,
        uv,
        condition
      ];
}

//#2
@JsonSerializable()
class Condition extends Equatable {
  final int code;

  Condition({this.code});

  factory Condition.fromJson(Map<String, dynamic> json) =>
      _$ConditionFromJson(json);

  Map<String, dynamic> toJson() => _$ConditionToJson(this);

  @override
  List<Object> get props => [code];
}

//#3
@JsonSerializable(explicitToJson: true)
class Forecast extends Equatable {
  final List<Forecastday> forecastday;
  Forecast({
    this.forecastday,
  });

  factory Forecast.fromJson(Map<String, dynamic> json) =>
      _$ForecastFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastToJson(this);

  @override
  List<Object> get props => [forecastday];
}

//#4
@JsonSerializable(explicitToJson: true)
class Forecastday extends Equatable {
  final String date;
  final int dateEpoch;
  final Day day;
  final Astro astro;
  final List<Hour> hour;

  Forecastday({
    this.date,
    this.dateEpoch,
    this.day,
    this.astro,
    this.hour,
  });

  factory Forecastday.fromJson(Map<String, dynamic> json) =>
      _$ForecastdayFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastdayToJson(this);

  @override
  List<Object> get props => [date, dateEpoch, day, astro, hour];
}

//
@JsonSerializable(explicitToJson: true)
class Hour extends Equatable {
  final String time;
  final double tempC;
  final Condition condition;

  Hour({this.time, this.tempC, this.condition});

  factory Hour.fromJson(Map<String, dynamic> json) => _$HourFromJson(json);

  Map<String, dynamic> toJson() => _$HourToJson(this);

  @override
  List<Object> get props => [time, tempC, condition];
}

//
// @JsonSerializable()
// class ConditionHour extends Equatable {
//   final int code;

//   ConditionHour({this.code});

//   factory ConditionHour.fromJson(Map<String, dynamic> json) =>
//       _$ConditionHourFromJson(json);

//   Map<String, dynamic> toJson() => _$ConditionHourToJson(this);

//   @override
//   List<Object> get props => [code];
// }

//
@JsonSerializable()
class Astro extends Equatable {
  final String sunrise;
  final String sunset;

  Astro({this.sunrise, this.sunset});

  factory Astro.fromJson(Map<String, dynamic> json) => _$AstroFromJson(json);

  Map<String, dynamic> toJson() => _$AstroToJson(this);

  @override
  List<Object> get props => [sunrise, sunset];
}

//
@JsonSerializable()
class Day extends Equatable {
  final double maxTemp;
  final double minTemp;
  final double avgTemp;
  final double maxWind;
  final double totalPrecip;
  final double avgVisKm;
  final double avghumidity;
  final double uv;
  final Condition condition;

  Day(
      {this.maxTemp,
      this.minTemp,
      this.avgTemp,
      this.maxWind,
      this.totalPrecip,
      this.avgVisKm,
      this.avghumidity,
      this.condition,
      this.uv});

  factory Day.fromJson(Map<String, dynamic> json) => _$DayFromJson(json);

  Map<String, dynamic> toJson() => _$DayToJson(this);

  @override
  List<Object> get props => [
        maxTemp,
        minTemp,
        avgTemp,
        avgVisKm,
        maxWind,
        totalPrecip,
        avghumidity,
        uv,
        condition,
      ];
}
