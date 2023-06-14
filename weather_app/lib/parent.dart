import 'package:flutter/material.dart';

import 'child.dart';
import 'weather_data.dart';
import 'weather_service.dart';

// ignore: use_key_in_widget_constructors
class WeatherParent extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _WeatherParentState createState() => _WeatherParentState();
}

class _WeatherParentState extends State<WeatherParent> {
  final _weatherService = WeatherService();
  final _cityController = TextEditingController();
  WeatherData? _weatherData;

  @override
  void dispose() {
    _cityController.dispose();
    super.dispose();
  }

  // service
  Future<void> _getWeather() async {
    final city = _cityController.text;
    final weatherData = await _weatherService.getWeatherData(city);
    setState(() {
      _weatherData = weatherData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'ingrese el nombre de la ciudad',
              style: TextStyle(fontSize: 16.0),
            ),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _cityController,
                    decoration: const InputDecoration(
                      labelText: 'Ciudad',
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: _getWeather,
                  child: const Text('Obtener clima'),
                ),
                
              ],
            ),const SizedBox(height: 16.0),
                if (_weatherData != null)
                  WeatherChild(weatherData: _weatherData!),
          ],
          
        ),

      ),
    );
  }
}
