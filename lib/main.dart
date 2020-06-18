import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: ThemeData(
        primaryColor: Color(0xff393E5B),
        accentColor: Color(0xff404667),
        textTheme: TextTheme(
          display1: TextStyle(
            color: Color(0xffEDE6CB),
          ),
        ),
      ),
      home: TodayHomeScreen(),
    );
  }
}
//fasadf