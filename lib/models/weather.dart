// import 'package:equatable/equatable.dart';

// class WeatherCurrentModel extends Equatable {
//   final Forecast forecast;
//   // final double temp;
//   // final int isDay;
//   final Current current;
//   // final double windKm;
//   // final String windDr;
//   // final double pressure;
//   // final int humidity;
//   // final double feelsLike;
//   // final double visability;
//   // final double uv;

//   WeatherCurrentModel({
//     // this.temp,
//     this.forecast,
//     // this.isDay,
//     this.current,
//     // this.windKm,
//     // this.windDr,
//     // this.pressure,
//     // this.humidity,
//     // this.feelsLike,
//     // this.visability,
//     // this.uv,
//   });

//   static WeatherCurrentModel fromJson(dynamic json) {
//     return WeatherCurrentModel(
//         forecast: Forecast.fromJson(json['forecast']),
//         current: Current.fromJson(json['current']));
//   }

//   static WeatherCurrentModel toJson(dynamic json) {
//     return WeatherCurrentModel(
//         forecast: Forecast.fromJson(json['forecast']),
//         current: Current.fromJson(json['current']));
//   }

//   @override
//   List<Object> get props => [current];
// }

// class Current extends Equatable {
//   final double tempC;
//   final int isDay;
//   final Condition condition;
//   final double windKph;
//   final String windDir;
//   final double pressureMb;
//   final int humidity;
//   final double feelslikeC;
//   final double visKm;
//   final double uv;

//   Current(
//       {this.tempC,
//       this.isDay,
//       this.condition,
//       this.windKph,
//       this.windDir,
//       this.pressureMb,
//       this.humidity,
//       this.feelslikeC,
//       this.visKm,
//       this.uv});

//   static Current fromJson(dynamic json) {
//     return Current(
//       tempC: json['temp_c'] as double,
//       isDay: json['is_day'] as int,
//       windKph: json['wind_kph'] as double,
//       windDir: json['wind_dir'] as String,
//       pressureMb: json['pressure_mb'] as double,
//       humidity: json['humidity'] as int,
//       feelslikeC: json['feelslike_c'] as double,
//       visKm: json['vis_km'] as double,
//       uv: json['uv'] as double,
//       condition: Condition.fromJson(json['condition']),
//     );
//   }

//   @override
//   List<Object> get props => [
//         tempC,
//         isDay,
//         windKph,
//         windDir,
//         pressureMb,
//         humidity,
//         feelslikeC,
//         visKm,
//         uv,
//         condition
//       ];
// }

// class Condition extends Equatable {
//   final String conditionText;

//   Condition({this.conditionText});

//   static Condition fromJson(dynamic json) {
//     return Condition(
//       conditionText: json['text'] as String,
//     );
//   }

//   @override
//   List<Object> get props => [conditionText];
// }

// class Forecast extends Equatable {
//   final List<Forecastday> forecastday;
//   Forecast({
//     this.forecastday,
//   });

//   static Forecast fromJson(dynamic parsedJson) {
//     var list = parsedJson['forecastday'] as List;

//     print(list.runtimeType);
//     List<Forecastday> forecastList =
//         list.map((i) => Forecastday.fromJson(i)).toList();

//     return Forecast(
//       forecastday: forecastList,
//     );
//   }

//   // static Forecast fromJson(dynamic json) {
//   //   var forecastdayList = json['forecastday'] as List;
//   //   List<Forecastday> _forecast =
//   //       forecastdayList.map(Forecastday.fromJson).toList();
//   //   return Forecast(
//   //     forecastday: _forecast,
//   //   );
//   // }

//   @override
//   List<Object> get props => [forecastday];
// }

// class Forecastday extends Equatable {
//   final String date;
//   final int dateEpoch;
//   final Day day;
//   final Astro astro;
//   final List<Hour> hour;

//   Forecastday({
//     this.date,
//     this.dateEpoch,
//     this.day,
//     this.astro,
//     this.hour,
//   });

//   static Forecastday fromJson(dynamic json) {
//     var tagObjsJson = json['hour'] as List;
//     List<Hour> _hours = tagObjsJson.map(Hour.fromJson).toList();
//     // List<Hour> _tags = tagObjsJson.map((tagJson) => Tag.fromJson(tagJson)).toList();
//     return Forecastday(
//       date: json['date'] as String,
//       dateEpoch: json['date_epoch'] as int,
//       astro: Astro.fromJson(json['astro']),
//       day: Day.fromJson(json['day']),
//       hour: _hours,
//     );
//   }

//   @override
//   List<Object> get props => [date, dateEpoch, day, astro, hour];
// }

// class Hour extends Equatable {
//   final String time;
//   final double tempC;
//   final ConditionHour conditionHour;

//   Hour({this.time, this.tempC, this.conditionHour});

//   static Hour fromJson(dynamic json) {
//     return Hour(
//       time: json['sunrise'] as String,
//       tempC: json['sunset'] as double,
//       conditionHour: ConditionHour.fromJson(json['condition']),
//     );
//   }

//   @override
//   List<Object> get props => [time, tempC, conditionHour];
// }

// class ConditionHour extends Equatable {
//   final int code;

//   ConditionHour({this.code});

//   static ConditionHour fromJson(dynamic json) {
//     return ConditionHour(
//       code: json['code'] as int,
//     );
//   }

//   @override
//   List<Object> get props => [code];
// }

// class Astro extends Equatable {
//   final String sunrise;
//   final String sunset;

//   Astro({this.sunrise, this.sunset});

//   static Astro fromJson(dynamic json) {
//     return Astro(
//       sunrise: json['sunrise'] as String,
//       sunset: json['sunset'] as String,
//     );
//   }

//   @override
//   List<Object> get props => [sunrise, sunset];
// }

// class Day extends Equatable {
//   final double maxTemp;
//   final double minTemp;
//   final double avgTemp;
//   final double maxWind;
//   final double totalPrecip;
//   final double avgVisKm;
//   final double avghumidity;
//   final double uv;

//   Day(
//       {this.maxTemp,
//       this.minTemp,
//       this.avgTemp,
//       this.maxWind,
//       this.totalPrecip,
//       this.avgVisKm,
//       this.avghumidity,
//       this.uv});

//   static Day fromJson(dynamic json) {
//     return Day(
//       maxTemp: json['maxtemp_c'] as double,
//       minTemp: json['mintemp_c'] as double,
//       avgTemp: json['avgtemp_c'] as double,
//       maxWind: json['maxwind_kph'] as double,
//       totalPrecip: json['totalprecip_mm'] as double,
//       avgVisKm: json['avgvis_km'] as double,
//       avghumidity: json['avghumidity'] as double,
//       uv: json['uv'] as double,
//     );
//   }

//   @override
//   List<Object> get props => [
//         maxTemp,
//         minTemp,
//         avgTemp,
//         avgVisKm,
//         maxWind,
//         totalPrecip,
//         avghumidity,
//         uv
//       ];
// }
