import 'package:flutter/material.dart';

Map<int, Map<String, dynamic>> weatherData = {
  0: {"desc": "Clear sky", "icon": Icons.sunny},
  1: {"desc": "Mainly clear", "icon": Icons.cloud_outlined},
  2: {"desc": "Partly cloudy", "icon": Icons.cloud_outlined},
  3: {"desc": "Overcast", "icon": Icons.cloud},
  45: {"desc": "Fog", "icon": Icons.foggy},
  48: {"desc": "Depositing rime fog", "icon": Icons.foggy},
  51: {"desc": "Light drizzle", "icon": Icons.question_mark},
  53: {"desc": "Moderate drizzle", "icon": Icons.question_mark},
  55: {"desc": "Dense drizzle", "icon": Icons.question_mark},
  56: {"desc": "Light freezing drizzle", "icon": Icons.question_mark},
  57: {"desc": "Dense freezing drizzle", "icon": Icons.question_mark},
  61: {"desc": "Slight rain", "icon": Icons.storm},
  63: {"desc": "Moderate rain", "icon": Icons.shower},
  65: {"desc": "Heavy rain", "icon": Icons.question_mark},
  66: {"desc": "Light freezing rain", "icon": Icons.question_mark},
  67: {"desc": "Heavy freezing rain", "icon": Icons.question_mark},
  71: {"desc": "Slight snow fall", "icon": Icons.question_mark},
  73: {"desc": "Moderate snow fall", "icon": Icons.question_mark},
  75: {"desc": "Heavy snow fall", "icon": Icons.question_mark},
  77: {"desc": "Snow grains", "icon": Icons.question_mark},
  80: {"desc": "Slight rain showers", "icon": Icons.shower},
  81: {"desc": "Moderate rain showers", "icon": Icons.shower},
  82: {"desc": "Heavy rain showers", "icon": Icons.question_mark},
  85: {"desc": "Slight snow showers", "icon": Icons.question_mark},
  86: {"desc": "Heavy snow showers", "icon": Icons.question_mark},
  95: {"desc": "Slight or moderate thunderstorm", "icon": Icons.question_mark},
  96: {"desc": "Thunderstorm with slight hail", "icon": Icons.storm},
  99: {"desc": "Thunderstorm with heavy hail", "icon": Icons.storm},
};

String getWeatherDescription(int code) {
  if (weatherData.containsKey(code)) {
    return weatherData[code]!["desc"] as String;
  } else {
    return "Unknown code";
  }
}

IconData getWeatherIcon(int code) {
  if (weatherData.containsKey(code)) {
    return weatherData[code]!["icon"] as IconData;
  } else {
    return Icons.help_outline;
  }
}
