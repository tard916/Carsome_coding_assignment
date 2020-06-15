import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:weather/providers/weather.dart';
import 'package:weather/ui/tabs/location.dart';
import 'package:weather/ui/tabs/forecast_weather.dart';
import 'package:weather/ui/tabs/today_weather.dart';

class BottomBarWidget extends StatefulWidget {
  @override
  _BottomBarWidgetState createState() => _BottomBarWidgetState();
}

class _BottomBarWidgetState extends State<BottomBarWidget> {
  var _screens = [
    TodayWeather(),
    ForcastWeather(),
    Location(),
  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<WeatherProvider>(context);
    return Scaffold(
      body: _screens[provider.currentTab],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: provider.currentTab,
        backgroundColor: Colors.white60,
        items: [
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.locationArrow),
              title: Text('Now'),
              backgroundColor: Colors.blueGrey),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.calendarAlt),
              title: Text('Forecast'),
              backgroundColor: Colors.blueGrey),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.playCircle),
              title: Text('Location'),
              backgroundColor: Colors.blueGrey),
        ],
        onTap: (index) {
          provider.currentTab = index;
          print(provider.currentTab);
        },
      ),
    );
  }
}
