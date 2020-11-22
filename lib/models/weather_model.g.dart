// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherCurrentModel _$WeatherCurrentModelFromJson(Map<String, dynamic> json) {
  return WeatherCurrentModel(
    forecast: json['forecast'] == null
        ? null
        : Forecast.fromJson(json['forecast'] as Map<String, dynamic>),
    current: json['current'] == null
        ? null
        : Current.fromJson(json['current'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$WeatherCurrentModelToJson(
        WeatherCurrentModel instance) =>
    <String, dynamic>{
      'forecast': instance.forecast?.toJson(),
      'current': instance.current?.toJson(),
    };

Current _$CurrentFromJson(Map<String, dynamic> json) {
  return Current(
    temp_c: json['temp_c'] as double,
    isDay: json['is_day'] as int,
    condition: json['condition'] == null
        ? null
        : Condition.fromJson(json['condition'] as Map<String, dynamic>),
    windKph: (json['wind_kph'] as num)?.toDouble(),
    windDir: json['wind_dir'] as String,
    pressureMb: (json['pressure_mb'] as num)?.toDouble(),
    humidity: json['humidity'] as int,
    feelslikeC: (json['feelslike_c'] as num)?.toDouble(),
    visKm: (json['vis_km'] as num)?.toDouble(),
    uv: (json['uv'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$CurrentToJson(Current instance) => <String, dynamic>{
      'temp_c': instance.temp_c,
      'is_day': instance.isDay,
      'condition': instance.condition?.toJson(),
      'wind_kph': instance.windKph,
      'wind_dir': instance.windDir,
      'pressure_mb': instance.pressureMb,
      'humidity': instance.humidity,
      'feelslike_c': instance.feelslikeC,
      'vis_km': instance.visKm,
      'uv': instance.uv,
    };

Condition _$ConditionFromJson(Map<String, dynamic> json) {
  return Condition(
    code: json['code'] as int,
  );
}

Map<String, dynamic> _$ConditionToJson(Condition instance) => <String, dynamic>{
      'code': instance.code,
    };

Forecast _$ForecastFromJson(Map<String, dynamic> json) {
  return Forecast(
    forecastday: (json['forecastday'] as List)
        ?.map((e) =>
            e == null ? null : Forecastday.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ForecastToJson(Forecast instance) => <String, dynamic>{
      'forecastday': instance.forecastday?.map((e) => e?.toJson())?.toList(),
    };

Forecastday _$ForecastdayFromJson(Map<String, dynamic> json) {
  return Forecastday(
    date: json['date'] as String,
    dateEpoch: json['date_epoch'] as int,
    day: json['day'] == null
        ? null
        : Day.fromJson(json['day'] as Map<String, dynamic>),
    astro: json['astro'] == null
        ? null
        : Astro.fromJson(json['astro'] as Map<String, dynamic>),
    hour: (json['hour'] as List)
        ?.map(
            (e) => e == null ? null : Hour.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ForecastdayToJson(Forecastday instance) =>
    <String, dynamic>{
      'date': instance.date,
      'dateEpoch': instance.dateEpoch,
      'day': instance.day?.toJson(),
      'astro': instance.astro?.toJson(),
      'hour': instance.hour?.map((e) => e?.toJson())?.toList(),
    };

Hour _$HourFromJson(Map<String, dynamic> json) {
  return Hour(
    time: json['time'] as String,
    tempC: (json['temp_c'] as num)?.toDouble(),
    condition: json['condition'] == null
        ? null
        : Condition.fromJson(json['condition'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$HourToJson(Hour instance) => <String, dynamic>{
      'time': instance.time,
      'temp_c': instance.tempC,
      'condition': instance.condition?.toJson(),
    };

// ConditionHour _$ConditionHourFromJson(Map<String, dynamic> json) {
//   return ConditionHour(
//     code: json['code'] as int,
//   );
// }

// Map<String, dynamic> _$ConditionHourToJson(ConditionHour instance) =>
//     <String, dynamic>{
//       'code': instance.code,
//     };

Astro _$AstroFromJson(Map<String, dynamic> json) {
  return Astro(
    sunrise: json['sunrise'] as String,
    sunset: json['sunset'] as String,
  );
}

Map<String, dynamic> _$AstroToJson(Astro instance) => <String, dynamic>{
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
    };

Day _$DayFromJson(Map<String, dynamic> json) {
  return Day(
    maxTemp: (json['maxtemp_c'] as num)?.toDouble(),
    minTemp: (json['mintemp_c'] as num)?.toDouble(),
    avgTemp: (json['avgtemp_c'] as num)?.toDouble(),
    maxWind: (json['maxwind_kph'] as num)?.toDouble(),
    totalPrecip: (json['totalprecip_mm'] as num)?.toDouble(),
    avgVisKm: (json['avgvis_km'] as num)?.toDouble(),
    avghumidity: (json['avghumidity'] as num)?.toDouble(),
    uv: (json['uv'] as num)?.toDouble(),
    condition: json['condition'] == null
        ? null
        : Condition.fromJson(json['condition'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DayToJson(Day instance) => <String, dynamic>{
      'maxtemp_c': instance.maxTemp,
      'mintemp_c': instance.minTemp,
      'avgtemp_c': instance.avgTemp,
      'maxwind_kph': instance.maxWind,
      'totalprecip_mm': instance.totalPrecip,
      'avgvis_km': instance.avgVisKm,
      'avghumidity': instance.avghumidity,
      'uv': instance.uv,
      'condition': instance.condition?.toJson(),
    };
