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
      margin: EdgeInsets.only(bottom: 25.0, left: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Container(
              margin: EdgeInsets.only(
                left: 15.0,
              ),
              //color: Colors.red,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Text(
                      'Cloudy',
                      style: TextStyle(
                        // backgroundColor: Colors.black,
                        letterSpacing: 1.2,
                        color: kTextColor,
                        fontSize: MediaQuery.of(context).size.width * 0.1,
                        fontFamily: 'PlayfairDisplay',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Expanded(
                    child: FractionallySizedBox(
                      heightFactor: 1.2,
                      child: FittedBox(
                        child: Text(
                          '12`',
                          style: TextStyle(
                            // backgroundColor: Colors.black,
                            color: kTextColor,
                            letterSpacing: 1.5,
                            //fontSize: MediaQuery.of(context).size.width * 0.15,
                            fontFamily: 'PlayFairDisplay',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Icon(Icons.wb_sunny,
                color: kIconColor,
                size: MediaQuery.of(context).size.width * 0.35),
          ),
        ],
      ),
    );
  }
}
