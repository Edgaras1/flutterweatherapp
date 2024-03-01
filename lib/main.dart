import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weatherforecast/screens/home_screen.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
);

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkMode = false;
  Timer? _themeTimer;

  @override
  void initState() {
    super.initState();
    _scheduleThemeChange();
  }

  void _scheduleThemeChange() {
    final nowHour =
        int.parse(DateFormat.Hm().format(DateTime.now()).split(":")[0]);
    final isNightTime = nowHour >= 20 || nowHour < 6;
    if (_isDarkMode != isNightTime) setState(() => _isDarkMode = isNightTime);
    final duration = Duration(hours: (isNightTime ? 6 : 20) - nowHour);
    _themeTimer = Timer(duration, _scheduleThemeChange);
  }

  @override
  void dispose() {
    _themeTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: const HomeScreen(),
    );
  }
}
