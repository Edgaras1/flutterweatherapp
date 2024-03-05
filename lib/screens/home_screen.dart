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
  final OpenMeteoService _openMeteoService = OpenMeteoService();

  @override
  void initState() {
    super.initState();
    _weatherData = _openMeteoService.fetchWeatherData(
          latitude: '54.6892', longitude: '25.2798');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: buildSearchWidget(
          onSelected: (result) {
            setState(() {
              _location = result.name;
              _weatherData = _openMeteoService.fetchWeatherData(
                  latitude: result.latitude.toString(),
                  longitude: result.longitude.toString());
            });
          },
          suggestions: (String query) async {
            return _openMeteoService.fetchGeocodingData(query);
          },
        ),
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
                  const Text("Weekly forecast"),
                  const Divider(),
                  Flexible(
                    fit: FlexFit.loose,
                    child:
                        buildWeekForecast(snapshot.data!.daily.dailyInfoList),
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Text('Error Occurred: ${snapshot.error}');
            }

            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
