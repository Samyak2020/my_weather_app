import 'package:flutter/material.dart';
import 'package:myweatherapp/screens/search_screen.dart';
import 'package:myweatherapp/screens/this_week.dart';
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
  bool visible = true;
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
          iconSize: MediaQuery.of(context).size.width * 0.08,
          onPressed: () {},
        ),
        title: Text(
          'Weathery',
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width * 0.07,
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
            iconSize: MediaQuery.of(context).size.width * 0.08,
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
            flex: 6,
            child: Container(
              padding: EdgeInsets.only(left: 25.0, top: 10.0, bottom: 10.0),
              alignment: Alignment.bottomLeft,
              //color: Colors.red,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 5,
                    child: FittedBox(
                      child: Text(
                        'Kathmandu',
                        style: TextStyle(
                          // backgroundColor: Colors.black,
                          color: kTextColor,
                          fontFamily: 'SourceSansPro',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: FittedBox(
                      child: Text(
                        'Nepal',
                        style: TextStyle(
                          //backgroundColor: Colors.pink,
                          color: kTextColor,
                          fontFamily: 'SourceSansPro',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: FittedBox(
                      child: Text(
                        'Thursday, 5/27',
                        style: TextStyle(
                          //backgroundColor: Colors.indigo,
                          color: kTextColor,
                          fontFamily: 'SourceSansPro',
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: WeatherInfo(),
          ),
          Expanded(
            flex: 4,
            child: MiscInfo(),
          ),
          // Today,Tomorrow -->
          Expanded(
            flex: 2,
            child: Container(
              margin: EdgeInsets.only(top: 10.0),
              padding: EdgeInsets.fromLTRB(15.0, 0.0, 75.0, 0.0),
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
            flex: 8,
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

//Scaffold(
//                  appBar: AppBar(
//                    elevation: 0.0,
//                    leading: IconButton(
//                      icon: Icon(
//                        Icons.arrow_back_ios,
//                        color: kIconColor,
//                      ),
//                      iconSize: MediaQuery.of(context).size.width * 0.08,
//                      onPressed: () {
//                        Navigator.pop(context);
//                      },
//                    ),
//                  ),
//                  body: Container(
//                    color: Colors.red,
//                    child: Stack(
//                      fit: StackFit.expand,
//                    ),
//                  ),
//                );
