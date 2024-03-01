import 'package:flutter/material.dart';
import 'package:weatherforecast/models/weather_model.dart';
import 'package:weatherforecast/services/open_meteo.dart';
import 'package:weatherforecast/widgets/search_widget.dart';
import 'package:weatherforecast/widgets/today_forecast_widget.dart';
import 'package:weatherforecast/widgets/week_forecast_widget.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<WeatherData> weatherData;
  String location = "";

  @override
  void initState() {
    super.initState();
    weatherData = fetchWeatherData(latitude: '52.52', longitude: '13.41');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      themeMode: ThemeMode.dark,
      home: Scaffold(
        body: Center(
          child: FutureBuilder<WeatherData>(
            future: weatherData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: <Widget>[
                    buildSearchWidget(onSelected: (result) {
                      setState(() {
                        location = result.name;
                        weatherData = fetchWeatherData(
                            latitude: result.latitude.toString(),
                            longitude: result.longitude.toString());
                      });
                    }),
                    Expanded(
                        child: buildTodayForecast(snapshot.data!, location)),
                    Text("Weekly forecast"),
                    const Divider(),
                    Expanded(child: buildWeekForecast(snapshot.data!)),
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
