import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/providers/weather.dart';
import 'package:weather/ui/widget/bottomBar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChangeNotifierProvider<WeatherProvider>(
        create: (context) => WeatherProvider(),
        child: BottomBarWidget(),
      ),
    );
  }
}
