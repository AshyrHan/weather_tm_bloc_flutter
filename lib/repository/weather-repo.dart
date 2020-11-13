import 'package:weather_tm_bloc/models/weather_model.dart';
import 'package:weather_tm_bloc/services/weather_api.dart';

class WeatherRepository {
  WeatherApi weatherApi = WeatherApi();

  Future<WeatherModel> getWeather(String latlan) async {
    return weatherApi.fetchWeather(latlan);
  }
}
