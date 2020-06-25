import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:myweatherapp/services/location.dart';
import 'package:myweatherapp/services/networking.dart';
import 'package:myweatherapp/utilities/constants.dart';
import 'package:myweatherapp/services/weather.dart';
import 'home_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  // var latitude;
  // var longitude;

  void getLocationData() async {
    WeatherModel weatherModel = WeatherModel();
    var weatherData = await weatherModel.getLocationWeather();
    //print(weatherData);
    //this.weatherData = weatherData;
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return TodayHomeScreen(locationWeatherData: weatherData);
    }));
    // TomorrowScreen(tomorrowWeatherData: weatherData);
    // ThisWeek(thisWeekWeatherData: weatherData);
  }

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Color(0xff2D3044),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.055,
          ),
          Text(
            'Weathery',
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.13,
              color: kTextColor,
              letterSpacing: 5,
              fontFamily: 'PlayfairDisplay',
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.040,
          ),
          Text(
            'Please wait ,',
            style: TextStyle(
              // backgroundColor: Colors.black,
              color: kTextColor,
              fontSize: MediaQuery.of(context).size.width * 0.048,
              fontFamily: 'SourceSansPro',
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            'Fetching your location . . .',
            style: TextStyle(
              // backgroundColor: Colors.black,
              color: kTextColor,
              fontSize: MediaQuery.of(context).size.width * 0.048,
              fontFamily: 'SourceSansPro',
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          SpinKitPulse(
            color: kIconColor,
            size: MediaQuery.of(context).size.height * 0.42,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.045,
          ),
          Text(
            'If this takes too long, try : ',
            style: TextStyle(
              // backgroundColor: Colors.black,
              color: kTextColor,
              fontSize: MediaQuery.of(context).size.width * 0.042,
              fontFamily: 'SourceSansPro',
              fontWeight: FontWeight.w600,
            ),
          ),
          Container(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.width * 0.095),
            child: Text(
              "Turning on your location and wifi/data.",
              style: TextStyle(
                // backgroundColor: Colors.black,
                color: kTextColor,
                fontSize: MediaQuery.of(context).size.width * 0.042,
                fontFamily: 'SourceSansPro',
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
