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
      margin: EdgeInsets.only(bottom: 20.0, left: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Container(
              //padding: EdgeInsets.only(top: 15.0),
              margin: EdgeInsets.only(left: 15.0, top: 20.0),
              //color: Colors.red,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: FractionallySizedBox(
                      heightFactor: 0.9,
                      child: FittedBox(
                        child: Text(
                          'Cloudy',
                          style: TextStyle(
                            // backgroundColor: Colors.black,
                            color: kTextColor,
                            fontFamily: 'SourceSansPro',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: FractionallySizedBox(
                      heightFactor: 1.35,
                      child: FittedBox(
                        child: Text(
                          '12`',
                          style: TextStyle(
                            // backgroundColor: Colors.black,
                            color: kTextColor,
                            //fontSize: MediaQuery.of(context).size.width * 0.15,
                            fontFamily: 'PlayFairDisplay',
                            fontWeight: FontWeight.w700,
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
            child: FractionallySizedBox(
              heightFactor: 0.85,
              alignment: Alignment.topCenter,
              child: FittedBox(
                child: Icon(
                  Icons.wb_sunny,
                  color: kIconColor,
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
