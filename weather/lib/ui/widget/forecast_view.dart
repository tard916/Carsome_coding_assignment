import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather/models/Forecast.dart';
import 'package:weather/util/convert_icon.dart';
import 'package:weather/util/weather_util.dart';

Widget weatherForecastView(AsyncSnapshot<WeatherForecastModel> snapshot) {
  var forcastData = snapshot.data;

  Container weatherForecastView = Container(
    child: Padding(
      padding: const EdgeInsets.all(14.0),
      child: CarouselSlider(        
        options: CarouselOptions(
          height: 500.0,
          initialPage: 0,
          enlargeCenterPage: true,
          autoPlayInterval: Duration(seconds: 5),
          autoPlayAnimationDuration: Duration(milliseconds: 3500 ),
          pauseAutoPlayOnTouch: true,
        ),
        items: forcastData.list
            .map((item) => Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
              ),
                  child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            '${forcastData.city.name}, ${forcastData.city.country}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.black87,
            ),
          ),
          Text(
            '${Util.getFormattedDate(new DateTime.fromMillisecondsSinceEpoch(item.dt * 1000))}',
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: getWeatherIcon(
                weatherDescription: item.weather[0].main,
                color: Colors.blueGrey,
                size: 175),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 12,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '${item.main.temp.toStringAsFixed(0)} °C',
                  style: TextStyle(
                    fontSize: 34,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  '${item.weather[0].description.toUpperCase()}',
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 12,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Wind Speed',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '${item.wind.speed.toStringAsFixed(1)} km/h',
                      ),
                      Icon(
                        FontAwesomeIcons.wind,
                        size: 20,
                        color: Colors.blueGrey,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Humidity',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '${item.main.humidity.toStringAsFixed(0)} %',
                      ),
                      Icon(
                        FontAwesomeIcons.solidGrinBeamSweat,
                        size: 20,
                        color: Colors.blueGrey,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Max Temp',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '${item.main.tempMax.toStringAsFixed(0)} °C',
                      ),
                      Icon(
                        FontAwesomeIcons.temperatureHigh,
                        size: 20,
                        color: Colors.blueGrey,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
                ))
            .toList(),
      ),
    ),
  );

  return weatherForecastView;
}
