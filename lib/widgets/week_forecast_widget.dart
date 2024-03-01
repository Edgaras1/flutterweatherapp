import 'package:flutter/material.dart';
import 'package:weatherforecast/models/weather_model.dart';
import 'package:weatherforecast/utils/date_utils.dart';
import 'package:weatherforecast/utils/weather_code_helper.dart';

Widget buildWeekForecast(WeatherData weatherData) {
  final List<DailyWeatherInfo> dailyInfoList = weatherData.daily.dailyInfoList;

  return ListView.builder(
    itemCount: dailyInfoList.length,
    itemBuilder: (context, index) {
      final dailyInfo = dailyInfoList[index];

      return ListTile(
        leading: Icon(getWeatherIcon(dailyInfo.weatherCode)),
        title: Text(
          formatDate(dailyInfo.date).toUpperCase(),
        ),
        subtitle: Row(
          children: [
            Text(getWeatherDescription(dailyInfo.weatherCode)),
          ],
        ),
        trailing: Text("${dailyInfo.maxTemp}°C / ${dailyInfo.minTemp}°C",
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              // color: Colors.black,
            )),
        // dense: true,
      );
    },
  );
}
