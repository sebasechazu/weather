import 'package:flutter/material.dart';

import 'weather_data.dart';

class WeatherChild extends StatelessWidget {
  final WeatherData weatherData;

  const WeatherChild({super.key, required this.weatherData});

  String getWeatherIconClass(String description) {
    switch (description.toLowerCase()) {
      case 'cielo claro':
        return 'bi-sun';
      case 'nubes':
        return 'bi-cloud';
      case 'lluvia':
        return 'bi-cloud-rain';
      case 'tormenta':
        return 'bi-cloud-lightning-rain';
      case 'nieve':
        return 'bi-snow';
      default:
        return 'bi-cloud-sun';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.0),
                topRight: Radius.circular(8.0),
              ),
            ),
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Icon(
                  Icons.location_on,
                  color: Colors.white,
                  size: 24.0,
                ),
                const SizedBox(width: 8.0),
                Text(
                  weatherData.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                //const Icon(
                //getWeatherIconClass(weatherData.description) as IconData?,
                //size: 24.0,
                //),
                const SizedBox(width: 8.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${weatherData.temperature} °C',
                      style: const TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(weatherData.description),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.wb_sunny),
                  title: Text('${weatherData.wind} m/s'),
                  subtitle: const Text('Viento'),
                ),
                ListTile(
                  leading: const Icon(Icons.thermostat),
                  title: Text('${weatherData.tempmax} °C'),
                  subtitle: const Text('Temp Max'),
                ),
                ListTile(
                  leading: const Icon(Icons.water),
                  title: Text('${weatherData.humidity}'),
                  subtitle: const Text('Humedad'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
