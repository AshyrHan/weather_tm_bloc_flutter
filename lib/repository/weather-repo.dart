import 'package:weather_tm_bloc/models/weather_model.dart';
import 'package:weather_tm_bloc/services/weather_api.dart';

class WeatherRepository {
  WeatherApi weatherApi = WeatherApi();

  Future<WeatherCurrentModel> getWeather(String latlan) async {
    // ignore: avoid_print
    print('repo gitdi');
    return weatherApi.fetchWeather(latlan);
  }
}
