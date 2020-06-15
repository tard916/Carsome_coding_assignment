import 'dart:convert';

import 'package:http/http.dart';
import 'package:weather/models/Forecast.dart';
import 'package:weather/models/Weather.dart';
import 'package:weather/util/weather_util.dart';

class Network {
  Future<WeatherModel> getWeather({String cityName}) async {
    var apiUrl = 'https://api.openweathermap.org/data/2.5/weather?q=' +
        cityName +
        '&appid=' +
        Util.appId +
        '&units=metric';

    final res = await get(Uri.encodeFull(apiUrl));
    print('URL: ${Uri.encodeFull(apiUrl)}');

    if (res.statusCode == 200) {
      return WeatherModel.fromJson(json.decode(res.body));
    } else {
      throw Exception('Error getting weather info');
    }
  }

  Future<WeatherModel> getWeatherByLocation({lat, long}) async {
    var apiUrl = 'https://api.openweathermap.org/data/2.5/weather?lat=' +
        lat +
        '&lon=' +
        long +
        '&appid=' +
        Util.appId +
        '&units=metric';

    final res = await get(Uri.encodeFull(apiUrl));
    if (res.statusCode == 200) {
      return WeatherModel.fromJson(json.decode(res.body));
    } else {
      throw Exception('Error getting weather info');
    }
  }

  Future<WeatherForecastModel> getWeatherForecast({String cityName}) async {
    var apiUrl = 'https://api.openweathermap.org/data/2.5/forecast?q=' +
        cityName +
        '&appid=' +
        Util.appId +
        '&units=metric';

    final res = await get(Uri.encodeFull(apiUrl));
    if (res.statusCode == 200) {
      return WeatherForecastModel.fromJson(json.decode(res.body));
    } else {
      throw Exception('Error getting weather info');
    }
  }
}
