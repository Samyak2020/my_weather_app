import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myweatherapp/screens/this_week.dart';
import 'package:myweatherapp/utilities/constants.dart';
import 'package:myweatherapp/widgets/hourly_info_list.dart';
import 'package:myweatherapp/widgets/misc_info.dart';
import 'package:myweatherapp/widgets/weather_info.dart';

class TomorrowScreen extends StatefulWidget {
  TomorrowScreen({this.tomorrowWeatherData});

  final tomorrowWeatherData;

  @override
  _TomorrowScreenState createState() => _TomorrowScreenState();
}

class _TomorrowScreenState extends State<TomorrowScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: kIconColor,
          ),
          iconSize: MediaQuery.of(context).size.width * 0.085,
          onPressed: () {
            Navigator.pop(context);
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
            onPressed: () {},
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
                  ),
                  Expanded(
                    flex: 9,
                    child: FittedBox(
                      child: Text(
                        'Nepal',
                        style: TextStyle(
                          //backgroundColor: Colors.pink,
                          color: kTextColor,
                          fontSize:
                              MediaQuery.of(context).size.width * 0.1 * 0.8,
                          fontFamily: 'SourceSansPro',
                          fontWeight: FontWeight.w700,
                        ),
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
                        fontSize: MediaQuery.of(context).size.width * 0.1 * 0.4,
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
              padding: EdgeInsets.only(left: 25.0, right: 10.0),
              child: Text(
                'Discription text goes here',
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
              padding: EdgeInsets.fromLTRB(15.0, 0.0, 75.0, 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                    child: Text(
                      'Today',
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
                      Navigator.pop(context);
                    },
                  ),
                  Text(
                    'Tomorrow',
                    style: TextStyle(
                      // backgroundColor: Colors.black,
                      color: kTextColor,
                      fontSize: MediaQuery.of(context).size.width * 0.1 * 0.42,
                      fontFamily: 'SourceSansPro',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  GestureDetector(
                    child: Row(
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
