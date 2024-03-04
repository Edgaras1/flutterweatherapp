import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weatherforecast/models/weather_model.dart';
import 'package:weatherforecast/utils/date_utils.dart';
import 'package:weatherforecast/utils/weather_code_helper.dart';
import 'package:weatherforecast/widgets/week_forecast_widget.dart';

void main() {
  group('buildWeekForecast', () {
    testWidgets('displays forecast for each day', (tester) async {
      final List<DailyWeatherInfo> dailyMockData = [
        DailyWeatherInfo(
          date: '2024-03-03',
          weatherCode: 2,
          maxTemp: 20.5,
          minTemp: 12.0,
        ),
        DailyWeatherInfo(
          date: '2024-03-04',
          weatherCode: 61,
          maxTemp: 18.0,
          minTemp: 10.5,
        ),
        DailyWeatherInfo(
          date: '2024-03-05',
          weatherCode: 51,
          maxTemp: 19.0,
          minTemp: 9.0,
        ),
      ];

      await tester.pumpWidget(MaterialApp(
        home: Material(child: buildWeekForecast(dailyMockData)),
      ));

      //Verify widget elements
      expect(find.text(formatDate(dailyMockData[0].date).toUpperCase()),
          findsOneWidget);
      expect(find.text(getWeatherDescription(dailyMockData[0].weatherCode)),
          findsOneWidget);
      expect(
          find.text(
              '${dailyMockData[0].maxTemp}°C / ${dailyMockData[0].minTemp}°C'),
          findsOneWidget);

      // Verify total number of list items
      expect(find.byType(ListTile), findsNWidgets(dailyMockData.length));
    });
  });
}
