import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myweatherapp/screens/search_screen.dart';
import 'package:myweatherapp/screens/this_week.dart';
import 'package:myweatherapp/services/weather.dart';
import 'package:myweatherapp/utilities/constants.dart';
import 'package:myweatherapp/widgets/hourly_info_list.dart';
import 'package:myweatherapp/widgets/misc_info.dart';
import 'package:myweatherapp/widgets/weather_info.dart';

class TodayHomeScreen extends StatefulWidget {
  TodayHomeScreen({this.locationWeatherData, this.hourlyData, this.weeklyData});
  final locationWeatherData,
      hourlyData,
      weeklyData; // make weatherData in updateUI.

  @override
  _TodayHomeScreenState createState() => _TodayHomeScreenState();
}

class _TodayHomeScreenState extends State<TodayHomeScreen> {
  WeatherModel weatherModel = WeatherModel();
  var todayTemperature, todayWindSpeed;
  var dtNow;
  var humidity, clouds;
  String todayCondition, iconUrl, cityName, countryName, description;

  void updateUI({dynamic weatherData}) {
    setState(() {
      if (weatherData == null) {
        todayTemperature = 0;
        todayCondition = "Error";
        description = "Unable to get weather data";
        cityName = 'Unknown';
        countryName = 'Unknown';
        todayWindSpeed = '0.0';
        humidity = '';
        clouds = '';
        //dtNow = ' ';
        return;
      }
      var temp = weatherData['main']['temp'];
      todayTemperature = temp.toInt();
      todayCondition = weatherData['weather'][0]['main'];
      iconUrl = "http://openweathermap.org/img/wn/" +
          weatherData["weather"][0]["icon"] +
          "@2x.png";
      // http://openweathermap.org/img/wn/10d@2x.png
      //weatherData['weather'][0]['icon'];
      // http://openweathermap.org/img/wn/{Weather?[0]?.Icon}@2x.png

      cityName = weatherData['name'];
      countryName = weatherData['sys']['country'];
      description = weatherData['weather'][0]['description'];
      var windSpeed = weatherData['wind']['speed'];
      todayWindSpeed = windSpeed;
      humidity = weatherData['main']['humidity'];
      clouds = weatherData['clouds']['all'];
      var dateTime = weatherData['dt'];
      var format = DateFormat('EEE, MMM d, ' 'yy');
      dtNow =
          format.format(DateTime.fromMillisecondsSinceEpoch(dateTime * 1000));

      //print(todayTemperature);
    });
  }

  @override
  void initState() {
    super.initState();
    updateUI(weatherData: widget.locationWeatherData);
    //print('Location DATA AT LOADING SCREEN:${widget.locationWeatherData}');
    // 'widget' gives access to parent stateful widget
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(
              Icons.refresh,
              color: kIconColor,
            ),
            iconSize: MediaQuery.of(context).size.width * 0.085,
            onPressed: () async {
              var weatherData = await weatherModel.getLocationWeather();
              updateUI(weatherData: weatherData);
            },
          ),
          title: Text(
            'Weathery',
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.075,
              color: kTextColor,
              fontFamily: 'PlayfairDisplay',
              fontWeight: FontWeight.w600,
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.search,
                color: kIconColor,
              ),
              iconSize: MediaQuery.of(context).size.width * 0.085,
              onPressed: () async {
                var typedName = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchScreen(),
                  ),
                );
                if (typedName != null) {
                  var weatherDataForSearchedCity =
                      await weatherModel.getSearchedCityWeather(typedName);
                  updateUI(weatherData: weatherDataForSearchedCity);
                }
              },
            ),
          ],
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 5,
              child: Container(
                padding: EdgeInsets.only(left: 30.0, top: 5.0, bottom: 10.0),
                alignment: Alignment.bottomLeft,
                //color: Colors.red,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      flex: 9,
                      child: FittedBox(
                        child: Text(
                          cityName,
                          style: TextStyle(
                            // backgroundColor: Colors.black,
                            color: kTextColor,
                            fontSize: MediaQuery.of(context).size.width * 0.075,
                            fontFamily: 'SourceSansPro',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 9,
                      child: FittedBox(
                        child: Text(
                          countryName,
                          style: TextStyle(
                            //backgroundColor: Colors.pink,
                            color: kTextColor,
                            fontSize:
                                MediaQuery.of(context).size.width * 0.1 * 0.75,
                            fontFamily: 'SourceSansPro',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Text(
                        dtNow.toString(),
                        style: TextStyle(
                          //backgroundColor: Colors.indigo,
                          color: kTextColor,
                          fontSize:
                              MediaQuery.of(context).size.width * 0.1 * 0.42,
                          fontFamily: 'SourceSansPro',
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: WeatherInfo(
                  tempText: todayTemperature,
                  conditionText: todayCondition,
                  weatherIcon: NetworkImage(iconUrl)),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.only(left: 15.0, right: 15.0),
                child: Text(
                  ' ${description[0].toUpperCase()}${description.substring(1).toLowerCase()} ',
                  style: TextStyle(
                    //backgroundColor: Colors.indigo,
                    color: kTextColor,
                    fontSize: MediaQuery.of(context).size.width * 0.1 * 0.5,
                    fontFamily: 'SourceSansPro',
                    fontWeight: FontWeight.w100,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: MiscInfo(
                  windSpeed: todayWindSpeed,
                  humidity: humidity,
                  clouds: clouds),
            ),
            // Today,Tomorrow -->
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.fromLTRB(35.0, 0.0, 75.0, 3.0),
                //margin: EdgeInsets.only(top: 30.0),
                // color: Colors.green,
                child: Row(
                  children: <Widget>[
                    Text(
                      'Next 48 hours',
                      style: TextStyle(
                        // backgroundColor: Colors.black,
                        color: kTextColor,
                        fontSize:
                            MediaQuery.of(context).size.width * 0.1 * 0.42,
                        fontFamily: 'SourceSansPro',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.07),
                    //GestureDetector(
                    //  child: Text(
                    //    'Tomorrow',
                    //    style: TextStyle(
                    //      // backgroundColor: Colors.black,
                    //      color: Colors.white70,
                    //      fontSize:
                    //          MediaQuery.of(context).size.width * 0.1 * 0.38,
                    //      fontFamily: 'SourceSansPro',
                    //      fontWeight: FontWeight.w600,
                    //    ),
                    //  ),
                    //  onTap: () {
                    //    setState(() {
                    //      Navigator.push(
                    //        context,
                    //        new MaterialPageRoute(
                    //          builder: (context) => TomorrowScreen(),
                    //        ),
                    //      );
                    //    });
                    //  },
                    //),
                    GestureDetector(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Next 7days',
                            style: TextStyle(
                              // backgroundColor: Colors.black,
                              color: Colors.white70,
                              fontSize: MediaQuery.of(context).size.width *
                                  0.1 *
                                  0.38,
                              fontFamily: 'SourceSansPro',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            width: 2.0,
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.white70,
                            size:
                                MediaQuery.of(context).size.width * 0.1 * 0.38,
                          ),
                        ],
                      ),
                      onTap: () {
                        setState(() {
                          Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => ThisWeek(
                                      thisWeekWeatherData: widget.weeklyData,
                                    )),
                          );
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Padding(
                padding: EdgeInsets.fromLTRB(40.0, 0.0, 0.0, 15.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(25.0), right: Radius.zero),
                    color: Color(0xffC4C4C4),
                  ),
                  child: HourlyInfoList(
                    jsonHourlyData: widget.hourlyData,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
