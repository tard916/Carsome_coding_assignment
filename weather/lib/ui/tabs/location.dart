import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/models/Weather.dart';
import 'package:weather/providers/weather.dart';
import 'package:weather/ui/widget/weather_view.dart';

class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<WeatherProvider>(context);
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: FutureBuilder<WeatherModel>(
                future: provider.getWeatherByLoction(),
                builder:
                    (BuildContext context, AsyncSnapshot<WeatherModel> snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        weatherView(snapshot),
                      ],
                    );
                  } else {
                    return Container(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
