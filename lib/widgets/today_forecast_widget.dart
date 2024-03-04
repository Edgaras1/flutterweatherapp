import 'package:flutter/material.dart';
import 'package:weatherforecast/models/weather_model.dart';
import 'package:weatherforecast/utils/weather_code_helper.dart';

Widget buildTodayForecast(WeatherData weatherData, String location) {
  final weather = weatherData.current;
  final units = weatherData.currentUnits;

  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Padding(
        padding: const EdgeInsets.only(bottom: 6.0),
        child: Text(
          location,
          style: const TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Text(
        "${weather.temperature2m.toString()} ${units.temperature2m}",
        style: const TextStyle(fontSize: 28),
      ),
      Text(getWeatherDescription(weather.weatherCode)),
      Icon(getWeatherIcon(weather.weatherCode)),
      // Icon(Icons.weather)
      Padding(
        padding: const EdgeInsets.only(top: 24.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            WeatherDetail(
                title: "Humidity",
                value:
                    "${weather.relativeHumidity2m.toString()}${units.relativeHumidity2m}"),
            const SizedBox(width: 50),
            WeatherDetail(
                title: "Wind",
                value:
                    "${weather.windSpeed10m.toString()} ${units.windSpeed10m}"),
            const SizedBox(width: 50),
            WeatherDetail(
                title: "Pressure",
                value:
                    " ${weather.surfacePressure.toString()} ${units.surfacePressure}"),
          ],
        ),
      ),
    ],
  );
}

class WeatherDetail extends StatelessWidget {
  final String title;
  final String value;

  const WeatherDetail({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title),
        Text(value),
      ],
    );
  }
}
