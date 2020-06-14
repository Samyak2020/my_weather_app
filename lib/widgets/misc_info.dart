import 'package:flutter/material.dart';
import 'package:myweatherapp/utilities/constants.dart';

class MiscInfo extends StatefulWidget {
  @override
  _MiscInfoState createState() => _MiscInfoState();
}

class _MiscInfoState extends State<MiscInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Column(
            children: <Widget>[
              Expanded(
                child: FittedBox(
                  child: Icon(
                    Icons.all_inclusive,
                    size: 15.0,
                    color: kTextColor,
                  ),
                ),
              ),
              Text(
                '0.8kmph',
                style: TextStyle(
                  color: kTextColor,
                  fontSize: 20.0,
                  fontFamily: 'SourceSansPro',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Expanded(
                child: FittedBox(
                  child: Icon(
                    Icons.grain,
                    size: 15.0,
                    color: kTextColor,
                  ),
                ),
              ),
              Text(
                '1.2mm',
                style: TextStyle(
                  color: kTextColor,
                  fontSize: 20.0,
                  fontFamily: 'SourceSansPro',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Expanded(
                child: FittedBox(
                  child: Icon(
                    Icons.cloud,
                    size: 15.0,
                    color: kTextColor,
                  ),
                ),
              ),
              Text(
                '75`',
                style: TextStyle(
                  color: kTextColor,
                  fontSize: 20.0,
                  fontFamily: 'SourceSansPro',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
