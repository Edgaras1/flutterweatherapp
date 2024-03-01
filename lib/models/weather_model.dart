class WeatherData {
  final double latitude;
  final double longitude;
  final double generationTimeMs;
  final int utcOffsetSeconds;
  final String timezone;
  final String timezoneAbbreviation;
  final double elevation;
  final CurrentUnits currentUnits;
  final Current current;
  final DailyUnits dailyUnits;
  final Daily daily;

  WeatherData({
    required this.latitude,
    required this.longitude,
    required this.generationTimeMs,
    required this.utcOffsetSeconds,
    required this.timezone,
    required this.timezoneAbbreviation,
    required this.elevation,
    required this.currentUnits,
    required this.current,
    required this.dailyUnits,
    required this.daily,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) => WeatherData(
        latitude: json['latitude'] as double,
        longitude: json['longitude'] as double,
        generationTimeMs: json['generationtime_ms'] as double,
        utcOffsetSeconds: json['utc_offset_seconds'] as int,
        timezone: json['timezone'] as String,
        timezoneAbbreviation: json['timezone_abbreviation'] as String,
        elevation: json['elevation'] as double,
        currentUnits: CurrentUnits.fromJson(json['current_units']),
        current: Current.fromJson(json['current']),
        dailyUnits: DailyUnits.fromJson(json['daily_units']),
        daily: Daily.fromJson(json['daily']),
      );
}

class CurrentUnits {
  final String time;
  final String interval;
  final String temperature2m;
  final String weatherCode;

  CurrentUnits({
    required this.time,
    required this.interval,
    required this.temperature2m,
    required this.weatherCode,
  });

  factory CurrentUnits.fromJson(Map<String, dynamic> json) => CurrentUnits(
        time: json['time'] as String,
        interval: json['interval'] as String,
        temperature2m: json['temperature_2m'] as String,
        weatherCode: json['weather_code'] as String,
      );
}

class Current {
  final String time;
  final int interval;
  final double temperature2m;
  final int weatherCode;

  Current({
    required this.time,
    required this.interval,
    required this.temperature2m,
    required this.weatherCode,
  });

  factory Current.fromJson(Map<String, dynamic> json) => Current(
        time: json['time'] as String,
        interval: json['interval'] as int,
        temperature2m: json['temperature_2m'] as double,
        weatherCode: json['weather_code'] as int,
      );
}

class DailyUnits {
  final String time;
  final String weatherCode;
  final String temperature2mMax;
  final String temperature2mMin;

  DailyUnits({
    required this.time,
    required this.weatherCode,
    required this.temperature2mMax,
    required this.temperature2mMin,
  });

  factory DailyUnits.fromJson(Map<String, dynamic> json) => DailyUnits(
        time: json['time'] as String,
        weatherCode: json['weather_code'] as String,
        temperature2mMax: json['temperature_2m_max'] as String,
        temperature2mMin: json['temperature_2m_min'] as String,
      );
}

class Daily {
  final List<DailyWeatherInfo> dailyInfoList;

  Daily({required this.dailyInfoList});

  factory Daily.fromJson(Map<String, dynamic> json) => Daily(
        dailyInfoList: List<DailyWeatherInfo>.from(
          json['time']
              .asMap()
              .entries
              .map((entry) => DailyWeatherInfo(
                    date: entry.value,
                    weatherCode: json['weather_code'][entry.key],
                    maxTemp: json['temperature_2m_max'][entry.key],
                    minTemp: json['temperature_2m_min'][entry.key],
                  ))
              .toList(),
        ),
      );
}

class DailyWeatherInfo {
  final String date;
  final int weatherCode;
  final double maxTemp;
  final double minTemp;

  DailyWeatherInfo({
    required this.date,
    required this.weatherCode,
    required this.maxTemp,
    required this.minTemp,
  });
}
