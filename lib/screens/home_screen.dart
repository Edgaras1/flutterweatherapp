import 'package:flutter/material.dart';
import 'package:weatherforecast/models/weather_model.dart';
import 'package:weatherforecast/services/open_meteo.dart';
import 'package:weatherforecast/widgets/search_widget.dart';
import 'package:weatherforecast/widgets/today_forecast_widget.dart';
import 'package:weatherforecast/widgets/week_forecast_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<WeatherData> _weatherData;
  String _location = "Vilnius";

  @override
  void initState() {
    super.initState();
    _weatherData = fetchWeatherData(latitude: '54.6892', longitude: '25.2798');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: buildSearchWidget(onSelected: (result) {
          setState(() {
            _location = result.name;
            _weatherData = fetchWeatherData(
                latitude: result.latitude.toString(),
                longitude: result.longitude.toString());
          });
        }),
        actions: [
          // Padding(
          //   padding: const EdgeInsets.only(right: 12),
          //   child: IconButton(
          //     icon: Icon(
          //       _isDarkTheme ? Icons.brightness_2 : Icons.wb_sunny,
          //     ),
          //     onPressed: () {
          //       setState(() => _isDarkTheme = !_isDarkTheme);
          //     },
          //   ),
          // ),
        ],
      ),
      body: Center(
        child: FutureBuilder<WeatherData>(
          future: _weatherData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: <Widget>[
                  Flexible(
                      fit: FlexFit.tight,
                      child: buildTodayForecast(snapshot.data!, _location)),
                  Text("Weekly forecast"),
                  const Divider(),
                  Flexible(
                    fit: FlexFit.loose,
                    child: buildWeekForecast(snapshot.data!),
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Text('hasError: ${snapshot.error}');
            }

            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
