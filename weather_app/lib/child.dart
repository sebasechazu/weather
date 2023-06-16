import 'package:flutter/material.dart';
import 'package:weather_app/style.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
        color: colorDark,
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: colorBlue,
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                SizedBox(
                  width: 24,
                  height: 24,
                  child: SvgPicture.network(
                    'http://www.w3.org/2000/svg',
                    color: colorLighten,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  weatherData.name,
                  style: const TextStyle(
                    fontSize: 16,
                    color: colorLighten,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.wb_sunny,
                        color: colorLighten,
                        size: 48.0,
                      ),
                      const SizedBox(width: 8.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${weatherData.temperature} °C',
                            style: const TextStyle(
                              fontSize: 34.0,
                              fontWeight: FontWeight.bold,
                              color: colorLighten,
                            ),
                          ),
                          Text(
                            weatherData.description,
                            style: const TextStyle(color: colorLighten),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      ListTile(
                        leading:
                            const Icon(Icons.wb_sunny, color: colorLighten),
                        title: Text(
                          '${weatherData.wind} m/s',
                          style: const TextStyle(
                            fontSize: 12,
                            color: colorLighten,
                          ),
                        ),
                        subtitle: const Text('Viento',
                            style: TextStyle(
                              fontSize: 12,
                              color: colorLighten,
                            )),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      ListTile(
                        leading:
                            const Icon(Icons.thermostat, color: colorLighten),
                        title: Text(
                          '${weatherData.tempmax} °C',
                          style: const TextStyle(
                            fontSize: 12,
                            color: colorLighten,
                          ),
                        ),
                        subtitle: const Text('Temp Max',
                            style: TextStyle(
                              fontSize: 12,
                              color: colorLighten,
                            )),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      ListTile(
                        leading: const Icon(Icons.water, color: colorLighten),
                        title: Text(
                          '${weatherData.humidity}',
                          style: const TextStyle(
                            fontSize: 12,
                            color: colorLighten,
                          ),
                        ),
                        subtitle: const Text('Humedad',
                            style: TextStyle(
                              fontSize: 12,
                              color: colorLighten,
                            )),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
