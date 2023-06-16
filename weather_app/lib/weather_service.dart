import 'dart:convert' show json;
import 'package:http/http.dart' as http;
import 'weather_data.dart';
import 'package:weather_app/config.dart';

class WeatherService {
  Future<WeatherData> getWeatherData(String city) async {
    final apiUrl =
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric&lang=es';

    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final name = jsonData['name'];
      final temperature = jsonData['main']['temp'];
      final wind = jsonData['wind']['speed'];
      final tempmax = jsonData['main']['temp_max'];
      final humidity = jsonData['main']['humidity'];
      final description = jsonData['weather'][0]['description'];

      return WeatherData(
        name: name,
        temperature: temperature,
        tempmax: tempmax,
        wind: wind,
        humidity: humidity,
        description: description,
      );
    } else {
      throw Exception('Error al obtener los datos del clima');
    }
  }
}
