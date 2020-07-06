import 'package:flutter/material.dart';
import 'package:myweatherapp/utilities/constants.dart';
import 'package:weather_icons/weather_icons.dart';

class MiscInfo extends StatefulWidget {
  MiscInfo(
      {@required this.windSpeed,
      @required this.humidity,
      @required this.clouds});

  var windSpeed;
  final int humidity;
  final int clouds;

  @override
  _MiscInfoState createState() => _MiscInfoState();
}

class _MiscInfoState extends State<MiscInfo> {
  @override
  Widget build(BuildContext context) {
    var iconSize = MediaQuery.of(context).size.width * 0.08;
    var textSize = MediaQuery.of(context).size.width * 0.044;

    return Container(
      margin: EdgeInsets.only(
        bottom: 20.0,
      ),
      //color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            children: <Widget>[
              Expanded(
                flex: 5,
                child: WindIcon(
                  degree: 0.0,
                  color: kIconColor,
                  size: iconSize,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  '${widget.windSpeed.toString()} m/s',
                  style: TextStyle(
                    color: kTextColor,
                    fontSize: textSize,
                    fontFamily: 'SourceSansPro',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  'Wind Speed',
                  style: TextStyle(
                    // backgroundColor: Colors.black,
                    color: Colors.white70,
                    fontSize: MediaQuery.of(context).size.width * 0.1 * 0.35,
                    fontFamily: 'SourceSansPro',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Expanded(
                flex: 5,
                child: Icon(
                  Icons.blur_on,
                  color: kIconColor,
                  size: iconSize,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  '${widget.humidity.toString()} %',
                  style: TextStyle(
                    color: kTextColor,
                    fontSize: textSize,
                    fontFamily: 'SourceSansPro',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  'Humidity',
                  style: TextStyle(
                    // backgroundColor: Colors.black,
                    color: Colors.white70,
                    fontSize: MediaQuery.of(context).size.width * 0.1 * 0.35,
                    fontFamily: 'SourceSansPro',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Expanded(
                flex: 5,
                child: Icon(
                  Icons.cloud,
                  color: kIconColor,
                  size: iconSize,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  '${widget.clouds.toString()} %',
                  style: TextStyle(
                    color: kTextColor,
                    fontSize: textSize,
                    fontFamily: 'SourceSansPro',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  'Clouds',
                  style: TextStyle(
                    // backgroundColor: Colors.black,
                    color: Colors.white70,
                    fontSize: MediaQuery.of(context).size.width * 0.1 * 0.35,
                    fontFamily: 'SourceSansPro',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
