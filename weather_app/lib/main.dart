import 'package:flutter/material.dart';
import 'package:weather_app/parent.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      home: WeatherParent(),
    );
  }
}
