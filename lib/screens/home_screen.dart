import 'package:flutter/material.dart';
import 'package:myweatherapp/screens/tomorrow_screen.dart';
import 'package:myweatherapp/utilities/constants.dart';
import 'package:myweatherapp/widgets/hourly_info_list.dart';
import 'package:myweatherapp/widgets/misc_info.dart';
import 'package:myweatherapp/widgets/weather_info.dart';

class TodayHomeScreen extends StatefulWidget {
  @override
  _TodayHomeScreenState createState() => _TodayHomeScreenState();
}

class _TodayHomeScreenState extends State<TodayHomeScreen> {
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
            color: kTextColor,
          ),
          iconSize: 35.0,
          onPressed: () {},
        ),
        title: Text(
          'Weathery',
          style: TextStyle(
            fontSize: 30.0,
            color: kTextColor,
            fontFamily: 'PlayfairDisplay',
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: kTextColor,
            ),
            iconSize: 35.0,
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 9,
            child: Padding(
              padding: EdgeInsets.only(left: 25.0, top: 10.0),
              child: Container(
                alignment: Alignment.bottomLeft,
                //color: Colors.red,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Kathmandu',
                      style: TextStyle(
                        // backgroundColor: Colors.black,
                        color: kTextColor,
                        fontSize: 36.0,
                        fontFamily: 'SourceSansPro',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'Nepal',
                      style: TextStyle(
                        //backgroundColor: Colors.pink,
                        color: kTextColor,
                        fontSize: 32.0,
                        fontFamily: 'SourceSansPro',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'Thursday, 5/27',
                      style: TextStyle(
                        //backgroundColor: Colors.indigo,
                        color: kTextColor,
                        fontSize: 15.0,
                        fontFamily: 'SourceSansPro',
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 9,
            child: WeatherInfo(),
          ),
          Expanded(
            flex: 4,
            child: MiscInfo(),
          ),
          // Today,Tomorrow -->
          Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.fromLTRB(15.0, 22.0, 75.0, 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    'Today',
                    style: TextStyle(
                      // backgroundColor: Colors.black,
                      color: kTextColor,
                      fontSize: 15.0,
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
                        fontSize: 15.0,
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
                    child: Text(
                      'Next 7days',
                      style: TextStyle(
                        // backgroundColor: Colors.black,
                        color: Colors.white70,
                        fontSize: 15.0,
                        fontFamily: 'SourceSansPro',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 10,
            child: Padding(
              padding: EdgeInsets.fromLTRB(40.0, 0.0, 0.0, 20.0),
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
