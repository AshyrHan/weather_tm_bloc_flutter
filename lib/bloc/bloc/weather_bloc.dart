import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
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

      return WeatherLoaded(
        weatherModel: weather,
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

//  @override
//   WeatherState fromJson(Map<String, dynamic> json) {
//     return WeatherLoaded(
//       weatherModel: WeatherCurrentModel(
//         forecast: json
//       ),
//     );
//   }

//      @override

//     //  Map<String, dynamic> toJson() {
// 		// final Map<String, dynamic> data = new Map<String, dynamic>();
// 		// data['temp_c'] = this.tempC;
// 		// data['is_day'] = this.isDay;
// 		// if (this.condition != null) {
//     //   data['condition'] = this.condition.toJson();
//     // }
//    Map<String, dynamic> toJson(WeatherState state) {
//     if (state is WeatherLoaded) {
//       	final Map<String, dynamic> data = new Map<String, dynamic>();
// 		data['temp_c'] = state.weatherModel.current.tempC;
// 		data['is_day'] = state.weatherModel.current.isDay;

//       return data;

//       // var map = {
//       //   'temp': state.weatherModel.current.tempC,
//       //   'isDay': state.weatherModel.current.isDay,
//       //   'feelsLike': state.weatherModel.current.feelslikeC,
//       // };
//       // return map;
//     }
//     return null;
//   }
//   }

// @override
// WeatherState fromJson(Map<String, dynamic> json) {
//   throw UnimplementedError();
// }

// @override
// Map<String, dynamic> toJson(WeatherState state) {
//   throw UnimplementedError();
// }

// @override
// WeatherState fromJson(Map<String, dynamic> json) {
//   return WeatherLoaded(
//     weatherModel: WeatherCurrentModel(
//       temp: json['temp'] as double,
//       isDay: json['isDay'] as int,
//       feelsLike: json['feelsLike'] as double,
//     ),
//   );
// }

// @override
// Map<String, dynamic> toJson(WeatherState state) {
//   if (state is WeatherLoaded) {
//     var map = {
//       'temp': state.weatherModel.temp,
//       'isDay': state.weatherModel.isDay,
//       'feelsLike': state.weatherModel.feelsLike,
//     };
//     return map;
//   }
//   return null;
// }
