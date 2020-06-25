import 'package:flutter/material.dart';
import 'package:myweatherapp/utilities/constants.dart';

class MiscInfo extends StatefulWidget {
  @override
  _MiscInfoState createState() => _MiscInfoState();
}

class _MiscInfoState extends State<MiscInfo> {
  @override
  Widget build(BuildContext context) {
    var iconSize = MediaQuery.of(context).size.width * 0.08;
    var textSize = MediaQuery.of(context).size.width * 0.044;

    return Container(
      margin: EdgeInsets.only(bottom: 20.0, top: 5.0),
      //color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Icon(
                  Icons.all_inclusive,
                  color: kIconColor,
                  size: iconSize,
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  '0.8kmph',
                  style: TextStyle(
                    color: kTextColor,
                    fontSize: textSize,
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
                flex: 3,
                child: Icon(
                  Icons.grain,
                  color: kIconColor,
                  size: iconSize,
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  '1.2mm',
                  style: TextStyle(
                    color: kTextColor,
                    fontSize: textSize,
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
                flex: 3,
                child: Icon(
                  Icons.cloud,
                  color: kIconColor,
                  size: iconSize,
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  '75`',
                  style: TextStyle(
                    color: kTextColor,
                    fontSize: textSize,
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
