import 'package:flutter/material.dart';
import 'package:myweatherapp/utilities/constants.dart';

class WeatherInfo extends StatefulWidget {
  @override
  _WeatherInfoState createState() => _WeatherInfoState();
}

class _WeatherInfoState extends State<WeatherInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15.0, left: 10.0),
      //padding: EdgeInsets.only(bottom: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Container(
              //color: Colors.red,
              // color: Colors.green,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FittedBox(
                    child: Text(
                      'Cloudy',
                      style: TextStyle(
                        // backgroundColor: Colors.black,
                        color: kTextColor,
                        fontSize: 42.0,
                        fontFamily: 'SourceSansPro',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Text(
                    '12`',
                    style: TextStyle(
                      // backgroundColor: Colors.black,
                      color: kTextColor,
                      fontSize: 48.0,
                      fontFamily: 'SourceSansPro',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: FractionallySizedBox(
              heightFactor: 1,
              alignment: Alignment.topCenter,
              child: FittedBox(
                child: Icon(
                  Icons.wb_sunny,
                  color: kTextColor,
                  // size: 150.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
