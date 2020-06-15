import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:weather/models/Forecast.dart';
import 'package:weather/providers/weather.dart';
import 'package:weather/ui/widget/forecast_view.dart';

class ForcastWeather extends StatefulWidget {
  @override
  _ForcastWeatherState createState() => _ForcastWeatherState();
}

class _ForcastWeatherState extends State<ForcastWeather> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<WeatherProvider>(context);
    return Scaffold(
      body: ListView(
        children: <Widget>[
          dropDownWidget(provider),
          Container(
            child: FutureBuilder<WeatherForecastModel>(
              future: provider.getWeatherForecast(),
              builder: (BuildContext context,
                  AsyncSnapshot<WeatherForecastModel> snapshot) {
                if (snapshot.hasData) {
                  return Column(
                      children: <Widget>[
                        weatherForecastView(snapshot),
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
          )
        ],
      ),
    );
  }

  Widget dropDownWidget(provider) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        child: DropdownButton<String>(
          icon: const Icon(FontAwesomeIcons.city),
          hint: const Text("Kuala Lumpur "),
          value: provider.selected,
          onChanged: (value) {
            provider.setSelectedCity(value);
          },
          items: provider.cities.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}
