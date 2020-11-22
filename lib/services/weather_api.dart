import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:weather_tm_bloc/const.dart';

import 'package:weather_tm_bloc/models/weather_model.dart';

class WeatherApi {
  Future<WeatherCurrentModel> fetchWeather(String latlan) async {
    final weatherUrl = '$baseUrl$forecastW?key=$apiKey&q=$latlan&days=3';

    //final weatherUrl =
    //    'https://api.weatherapi.com/v1/current.json?key=474542f8d8ed494e92284130201211&q=37.6,61.83';
    final weatherResponse = await http.get(weatherUrl);

    if (weatherResponse.statusCode != 200) {
      throw Exception('error connetcion');
    }

    final dynamic weatherJson = jsonDecode(weatherResponse.body);
    return WeatherCurrentModel.fromJson(weatherJson);
  }

  // Future<Weather> fetchHourlyWeather(String latlan) async {
  //   final weatherUrl = '$baseUrl$forecastW?key=$apiKey&q=$latlan';

  //   final weatherResponse = await http.get(weatherUrl);

  //   if (weatherResponse.statusCode != 200) {
  //     throw Exception('error connetcion');
  //   }
  //   // ignore: avoid_print
  //   print(weatherResponse.body.length);
  //   final dynamic weatherJson = jsonDecode(weatherResponse.body);
  //   return Weather.fromJson(weatherJson);
  // }
}
// https://api.weatherapi.com/v1/current.json?key=474542f8d8ed494e92284130201211&q=37.6,61.83
//   Future<int> getLocationId(String city) async {
//     final locationUrl = '$baseUrl/api/location/search/?query=$city';
//     final locationResponse = await this.httpClient.get(locationUrl);
//     if (locationResponse.statusCode != 200) {
//       throw Exception('error getting locationId for city');
//     }

//     final locationJson = jsonDecode(locationResponse.body) as List;
//     return (locationJson.first)['woeid'];
//   }

//   Future<Weather> fetchWeather(int locationId) async {
//     final weatherUrl = '$baseUrl/api/location/$locationId';
//     final weatherResponse = await this.httpClient.get(weatherUrl);

//     if (weatherResponse.statusCode != 200) {
//       throw Exception('error getting weather for location');
//     }

//     final weatherJson = jsonDecode(weatherResponse.body);
//     return Weather.fromJson(weatherJson);
//   }
// }
