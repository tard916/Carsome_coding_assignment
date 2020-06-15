import 'package:flutter/material.dart';
import 'package:weather/models/Forecast.dart';
import 'package:weather/network/network.dart';
import 'package:geolocator/geolocator.dart';

// import '../models/Forecast.dart';
import '../models/Weather.dart';

class WeatherProvider with ChangeNotifier {
  List<String> _cities = [
    'Kuala Lumpur',
    'George Town',
    'Johor Bahru'
  ];

  Position _currentPosition;

  String _selectedCity;
  int _currentTab = 0;

  getCurrentLocation() async {
    final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
          this._currentPosition = position;
          notifyListeners();
    }).catchError((e) {
      print(e);
    });
  }

  get currentLocation => _currentPosition;

  set currentTab(int tab) {
    this._currentTab = tab; 
    notifyListeners();
  }
  get currentTab => _currentTab;

  List<String> get cities => _cities;
  String get selected => _selectedCity;

  void setSelectedCity(String cityName) {
    _selectedCity = cityName;
    notifyListeners();
  }
  
  Future<WeatherModel> getWeather({String cityName}) {
    if (_selectedCity == null) {
     var defaultCity = 'Kuala Lumpur';
     return new Network().getWeather(cityName: defaultCity);
    }
    return new Network().getWeather(cityName: _selectedCity);
  }

  Future<WeatherModel> getWeatherByLoction({double lat, double long}){
    getCurrentLocation();
    if(_currentPosition != null) {
      return new Network()
      .getWeatherByLocation(lat: _currentPosition.latitude.toString(), long: _currentPosition.longitude.toString());
    }
  }

  Future<WeatherForecastModel> getWeatherForecast({String cityName}) {
    if (_selectedCity == null) {
     var defaultCity = 'Kuala Lumpur';
     return new Network().getWeatherForecast(cityName: defaultCity);
    }
    return new Network().getWeatherForecast(cityName: _selectedCity);
  }
}