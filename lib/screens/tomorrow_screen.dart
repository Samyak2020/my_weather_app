import 'package:flutter/material.dart';
import 'package:myweatherapp/utilities/constants.dart';
import 'package:myweatherapp/widgets/hourly_info_list.dart';
import 'package:myweatherapp/widgets/misc_info.dart';
import 'package:myweatherapp/widgets/weather_info.dart';

class TomorrowScreen extends StatefulWidget {
  @override
  _TomorrowScreenState createState() => _TomorrowScreenState();
}

class _TomorrowScreenState extends State<TomorrowScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: kTextColor,
          ),
          iconSize: 35.0,
          onPressed: () {
            Navigator.pop(context);
          },
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
                    Row(
                      children: <Widget>[
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
                        SizedBox(
                          width: 8.0,
                        ),
                        Text(
                          '(Tomorrow)',
                          style: TextStyle(
                            //backgroundColor: Colors.indigo,
                            color: kTextColor,
                            fontSize: 12.0,
                            fontFamily: 'SourceSansPro',
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                      ],
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
                  GestureDetector(
                    child: Text(
                      'Today',
                      style: TextStyle(
                        // backgroundColor: Colors.black,
                        color: Colors.white70,
                        fontSize: 15.0,
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
                      fontSize: 15.0,
                      fontFamily: 'SourceSansPro',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Next 7days',
                    style: TextStyle(
                      // backgroundColor: Colors.black,
                      color: Colors.white70,
                      fontSize: 15.0,
                      fontFamily: 'SourceSansPro',
                      fontWeight: FontWeight.w600,
                    ),
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
