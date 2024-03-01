import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weatherforecast/models/weather_model.dart';

Future<WeatherData> fetchWeatherData({
  required double latitude,
  required double longitude,
}) async {
  final url = Uri.parse(
      'https://api.open-meteo.com/v1/forecast?latitude=52.52&longitude=13.409999&current=temperature_2m,weather_code&daily=weather_code,temperature_2m_max,temperature_2m_min&timezone=Europe%2FLondon');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    return WeatherData.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to fetch weather data: ${response.statusCode}');
  }
}
