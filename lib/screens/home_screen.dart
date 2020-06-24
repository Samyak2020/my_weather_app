import 'package:flutter/material.dart';
import 'package:myweatherapp/screens/search_screen.dart';
import 'package:myweatherapp/screens/this_week.dart';
import 'package:myweatherapp/screens/tomorrow_screen.dart';
import 'package:myweatherapp/services/location.dart';
import 'package:myweatherapp/services/networking.dart';
import 'package:myweatherapp/utilities/constants.dart';
import 'package:myweatherapp/widgets/hourly_info_list.dart';
import 'package:myweatherapp/widgets/misc_info.dart';
import 'package:myweatherapp/widgets/weather_info.dart';
import 'package:geolocator/geolocator.dart';
import 'package:myweatherapp/services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TodayHomeScreen extends StatefulWidget {
  @override
  _TodayHomeScreenState createState() => _TodayHomeScreenState();
}

class _TodayHomeScreenState extends State<TodayHomeScreen> {
  var latitude;
  var longitude;

  void getLocationData() async {
    LocationTask locationTask = LocationTask();

    await locationTask.getCurrentLocation();
    this.latitude = locationTask.latitude;
    this.longitude = locationTask.longitude;

    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');

    var weatherData = await networkHelper.getData();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          onPressed: () {
            print("Hello");
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
            onPressed: () {
              setState(() {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchScreen(),
                  ),
                );
              });
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
                    child: Text(
                      'Kathmandu',
                      style: TextStyle(
                        // backgroundColor: Colors.black,
                        color: kTextColor,
                        fontSize: MediaQuery.of(context).size.width * 0.085,
                        fontFamily: 'SourceSansPro',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 9,
                    child: Text(
                      'Nepal',
                      style: TextStyle(
                        //backgroundColor: Colors.pink,
                        color: kTextColor,
                        fontSize: MediaQuery.of(context).size.width * 0.1 * 0.8,
                        fontFamily: 'SourceSansPro',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Text(
                      'Thursday, 5/27',
                      style: TextStyle(
                        //backgroundColor: Colors.indigo,
                        color: kTextColor,
                        fontSize:
                            MediaQuery.of(context).size.width * 0.1 * 0.38,
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
            child: WeatherInfo(),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.only(left: 15.0, right: 15.0),
              child: Text(
                '" asdfsetyshgduf ahaisf h;ajlsfhli ajslkfas ;fasflj ka;sn faslbfjasvfiauofb. "',
                style: TextStyle(
                  //backgroundColor: Colors.indigo,
                  color: kTextColor,
                  fontSize: MediaQuery.of(context).size.width * 0.1 * 0.42,
                  fontFamily: 'SourceSansPro',
                  fontWeight: FontWeight.w100,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: MiscInfo(),
          ),
          // Today,Tomorrow -->
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.fromLTRB(15.0, 0.0, 75.0, 3.0),
              //margin: EdgeInsets.only(top: 30.0),
              // color: Colors.green,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    'Today',
                    style: TextStyle(
                      // backgroundColor: Colors.black,
                      color: kTextColor,
                      fontSize: MediaQuery.of(context).size.width * 0.1 * 0.42,
                      fontFamily: 'SourceSansPro',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  GestureDetector(
                    child: Text(
                      'Tomorrow',
                      style: TextStyle(
                        // backgroundColor: Colors.black,
                        color: Colors.white70,
                        fontSize:
                            MediaQuery.of(context).size.width * 0.1 * 0.38,
                        fontFamily: 'SourceSansPro',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => TomorrowScreen()),
                        );
                      });
                    },
                  ),
                  GestureDetector(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Next 7days',
                          style: TextStyle(
                            // backgroundColor: Colors.black,
                            color: Colors.white70,
                            fontSize:
                                MediaQuery.of(context).size.width * 0.1 * 0.38,
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
                          size: MediaQuery.of(context).size.width * 0.1 * 0.38,
                        ),
                      ],
                    ),
                    onTap: () {
                      setState(() {
                        Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => ThisWeek()),
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
                  child: HourlyInfoList()),
            ),
          ),
        ],
      ),
    );
  }
}

//var temp = decodedData['main']['temp'];
//    var condition = decodedData['weather'][0]['id'];
//    var cityName = decodedData['name'];
