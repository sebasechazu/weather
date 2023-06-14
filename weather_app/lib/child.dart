import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';

import 'weather_data.dart';
class WeatherChild extends StatelessWidget {
  final WeatherData weatherData;

  // ignore: use_key_in_widget_constructors
  const WeatherChild({required this.weatherData});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8.0),
        Text(weatherData.name,style: const TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold)),
        const SizedBox(height: 8.0), 
        Text('Temperatura: ${weatherData.temperature}'),
        const SizedBox(height: 8.0), 
        Text('Humedad: ${weatherData.humidity}'),
        const SizedBox(height: 8.0), 
        Text('Descripción: ${weatherData.description}'),
        const SizedBox(height: 8.0), 
        const Icon(BootstrapIcons.sun),
      ],
    );
  }
}