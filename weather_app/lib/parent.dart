import 'package:flutter/material.dart';
import 'package:weather_app/style.dart';

import 'child.dart';
import 'weather_data.dart';
import 'weather_service.dart';
class WeatherParent extends StatefulWidget {
  const WeatherParent({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _WeatherParentState createState() => _WeatherParentState();
}

class _WeatherParentState extends State<WeatherParent> {
  final _weatherService = WeatherService();
  late String city;
  WeatherData? _weatherData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorDarken,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Center(
            child: SizedBox(
              width: 450,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Weather App',
                      style: TextStyle(
                        color: colorLight,
                        fontSize: 24,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Ingrese el nombre de una ciudad',
                      style: TextStyle(
                        color: colorLight,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              textAlign: TextAlign.center,
                              style: const TextStyle(color: colorLighten),
                              onChanged: (value) {
                                setState(() {
                                  city = value;
                                });
                              },
                            ),
                          ),
                          const SizedBox(width: 10),
                          GestureDetector(
                            onTap: () {
                              getWeather(city);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color:
                                    colorDarken, 
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Icon(
                                Icons.search,
                                color:
                                    colorLighten, 
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    if (_weatherData != null)
                      WeatherChild(weatherData: _weatherData!)
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> getWeather(String city) async {
    final weatherData = await _weatherService.getWeatherData(city);
    setState(() {
      _weatherData = weatherData;
    });
  }
}
