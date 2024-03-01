import 'package:flutter/material.dart';
import 'package:weatherforecast/models/weather_model.dart';
import 'package:weatherforecast/utils/weather_code_helper.dart';

Widget buildTodayForecast(WeatherData weatherData, String location) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Padding(
        padding: const EdgeInsets.only(bottom: 12.0),
        child: Text(
          location,
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Text(getWeatherDescription(weatherData.current.weatherCode)),
      Icon(getWeatherIcon(weatherData.current.weatherCode)),
      Text(
        "${weatherData.current.temperature2m.toString()}°",
        style: const TextStyle(fontSize: 28),
      ),
    ],
  );
}
