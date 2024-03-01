import 'package:flutter/material.dart';
import 'package:weatherforecast/models/weather_model.dart';
import 'package:weatherforecast/services/open_meteo.dart';
import 'package:weatherforecast/utils/weather_code_helper.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<WeatherData> weatherData;

  @override
  void initState() {
    super.initState();
    weatherData = fetchWeatherData(latitude: 52.52, longitude: 13.41);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Weather forecast'),
        ),
        body: Center(
          child: FutureBuilder<WeatherData>(
            future: weatherData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: <Widget>[
                    Text("London"),
                    Text(
                        "Temp: ${snapshot.data!.current.temperature2m.toString()}°"),
                    Text(getWeatherDescription(
                        snapshot.data!.current.weatherCode)),
                    Expanded(child: buildWeatherList(snapshot.data!)),
                  ],
                );
              } else if (snapshot.hasError) {
                return Text('hasError: ${snapshot.error}');
              }

              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}

Widget buildTodayWeather(WeatherData weatherData) {
  return Text(weatherData.current.weatherCode.toString());
}

Widget buildWeatherList(WeatherData weatherData) {
  final List<DailyWeatherInfo> dailyInfoList = weatherData.daily.dailyInfoList;

  List<Widget> weatherItems = [];
  for (var dailyInfo in dailyInfoList) {
    weatherItems.add(
      ListTile(
        title: Text(dailyInfo.date),
        subtitle: Row(
          children: [
            Text("High: ${dailyInfo.maxTemp}°C"),
            const Spacer(),
            Text("Low: ${dailyInfo.minTemp}°C"),
          ],
        ),
        trailing: const Icon(Icons.thermostat),
      ),
    );
  }

  return ListView(children: weatherItems);
}
