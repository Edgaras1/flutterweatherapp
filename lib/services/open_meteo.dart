import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:weatherforecast/models/geocoding_model.dart';
import 'package:weatherforecast/models/weather_model.dart';

class OpenMeteoService {
  final http.Client _client;
  OpenMeteoService({http.Client? httpClient})
      : _client = httpClient ?? http.Client();

  Future<WeatherData> fetchWeatherData(
      {required String latitude, required String longitude}) async {
    final response =
        await _client.get(Uri.https('api.open-meteo.com', '/v1/forecast', {
      'latitude': latitude,
      'longitude': longitude,
      'current':
          'temperature_2m,weather_code,relative_humidity_2m,surface_pressure,wind_speed_10m',
      'daily': 'weather_code,temperature_2m_max,temperature_2m_min',
      'timezone': 'Europe/London',
    }));

    if (response.statusCode == 200) {
      return WeatherData.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to fetch weather data: ${response.statusCode}');
    }
  }

  Future<List<SearchResult>> fetchGeocodingData(String name) async {
    final response = await _client.get(Uri.https(
        'geocoding-api.open-meteo.com',
        '/v1/search',
        {'name': name, 'count': '5', 'language': 'en', 'format': 'json'}));

    if (response.statusCode == 200) {
      final data = GeocodingSearchResponse.fromJson(jsonDecode(response.body));
      return data.results;
    } else {
      throw Exception('Failed to fetch geocoding data');
    }
  }
}
