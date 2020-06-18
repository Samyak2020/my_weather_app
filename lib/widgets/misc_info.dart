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
      padding: EdgeInsets.only(bottom: 10.0),
      //color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: FractionallySizedBox(
                  heightFactor: 0.75,
                  child: FittedBox(
                    child: Icon(
                      Icons.all_inclusive,
                      color: kIconColor,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: FractionallySizedBox(
                  heightFactor: 0.75,
                  child: FittedBox(
                    child: Text(
                      '0.8kmph',
                      style: TextStyle(
                        color: kTextColor,
                        //fontSize: 18.0,
                        fontFamily: 'SourceSansPro',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: FractionallySizedBox(
                  heightFactor: 0.75,
                  child: FittedBox(
                    child: Icon(
                      Icons.grain,
                      color: kIconColor,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: FractionallySizedBox(
                  heightFactor: 0.75,
                  child: FittedBox(
                    child: Text(
                      '1.2mm',
                      style: TextStyle(
                        color: kTextColor,
                        // fontSize: 18.0,
                        fontFamily: 'SourceSansPro',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: FractionallySizedBox(
                  heightFactor: 0.75,
                  child: FittedBox(
                    child: Icon(
                      Icons.cloud,
                      color: kIconColor,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: FractionallySizedBox(
                  heightFactor: 0.75,
                  child: FittedBox(
                    child: Text(
                      '75`',
                      style: TextStyle(
                        color: kTextColor,
                        //fontSize: 18.0,
                        fontFamily: 'SourceSansPro',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
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
