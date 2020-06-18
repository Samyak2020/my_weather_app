import 'package:flutter/material.dart';
import 'package:myweatherapp/models/hourly_list_items.dart';
import 'package:myweatherapp/utilities/constants.dart';

class HourlyInfoList extends StatefulWidget {
  @override
  _HourlyInfoListState createState() => _HourlyInfoListState();
}

class _HourlyInfoListState extends State<HourlyInfoList> {
  @override
  Widget build(BuildContext context) {
    return getHourlyListView();
  }

  Widget getHourlyListView() {
    var listView = ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.fromLTRB(14.0, 15.0, 0.0, 14.0),
          width: MediaQuery.of(context).size.width * 0.16,
          height: MediaQuery.of(context).size.height * 0.25,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.0),
            color: Color(0xff434761),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                items[index].hourText,
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.1 * 0.45,
                  color: Colors.white70,
                  fontFamily: 'SourceSansPro',
                  fontWeight: FontWeight.w600,
                ),
              ),
              Icon(
                items[index].icons,
                color: Color(0xffEDE6CB),
                size: MediaQuery.of(context).size.height * 0.1 * 0.5,
              ),
              Text(
                items[index].tempText,
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.1 * 0.45,
                  color: Colors.white70,
                  fontFamily: 'SourceSansPro',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        );
      },
    );
    return listView;
  }
}
