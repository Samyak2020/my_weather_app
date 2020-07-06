import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HourlyInfoList extends StatefulWidget {
  HourlyInfoList({this.jsonHourlyData});

  final jsonHourlyData;

  @override
  _HourlyInfoListState createState() => _HourlyInfoListState();
}

class _HourlyInfoListState extends State<HourlyInfoList> {
  Map hourly;
  List hourlyData;
  int todayTempText;
  DateFormat dateFormat = DateFormat('j');
  var timeData;

  var timeNow;

  Future getHourlyData() async {
    hourly = widget.jsonHourlyData;
    setState(() {
      hourlyData = hourly['hourly'];

      // timeData = hourlyData[0]['dt'];

      // var dateTime = weatherData['dt'];

      //print(timeNow);
    });
    //debugPrint('OUR DATA IS  :  ${hourlyData.toString()}');
  }

  // void updateHourlyDataList({dynamic hourlyWeatherData}) {
  //   setState(() {
  //     if (hourlyWeatherData == null) {
  //       todayTempText = 0;
  //       return;
  //     } else {
  //       todayTempText = hourlyWeatherData['hourly'][0]['temp'];
  //     }
  //   });
  // }

  @override
  void initState() {
    super.initState();
    // updateHourlyDataList(hourlyWeatherData: widget.jsonHourlyData);
    //print('HOURLY DATA IS: ${widget.jsonHourlyData}');
    // print('temperature at 12am is: $todayTempText');
    getHourlyData();
  }

  @override
  Widget build(BuildContext context) {
    return getHourlyListView();
  }

  Widget getHourlyListView() {
    var listView = ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: hourlyData == null ? 0 : hourlyData.length - 1,
      itemBuilder: (context, index) {
        timeData = hourlyData[index + 1]['dt'];
        timeNow = dateFormat
            .format(DateTime.fromMillisecondsSinceEpoch(timeData * 1000));

        return Container(
          margin: EdgeInsets.fromLTRB(14.0, 12.0, 0.0, 12.0),
          width: MediaQuery.of(context).size.width * 0.16,
          height: MediaQuery.of(context).size.height * 0.25,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.0),
            color: Color(0xff434761),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.width * 0.1 * 0.35),
                  child: Text(
                    //timeNow.toString(),
                    timeNow.toString(),

                    //hourlyData[index]['dt'],

                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.1 * 0.43,
                      color: Colors.white70,
                      fontFamily: 'SourceSansPro',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Image(
                  image: NetworkImage("http://openweathermap.org/img/wn/" +
                      hourlyData[index]['weather'][0]['icon'] +
                      "@2x.png"),
                  color: Color(0xffEDE6CB),
                  fit: BoxFit.fill,
                  //size: MediaQuery.of(context).size.height * 0.1 * 0.5,
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  '${hourlyData[index]['temp'].toInt()}°',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.1 * 0.45,
                    color: Colors.white70,
                    fontFamily: 'SourceSansPro',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
    return listView;
  }

//  List<HourlyData> items = [
//    HourlyData(
//      dt: '6 am',
//      icons: Icons.wb_sunny,
//      temp: 'asd', //todayTempText.toString()
//    ),
//    HourlyData(
//      dt: '7 am',
//      icons: Icons.wb_sunny,
//      temp: '18`',
//    ),
//    HourlyData(
//      dt: '8 am',
//      icons: Icons.wb_sunny,
//      temp: '18`',
//    ),
//    HourlyData(
//      dt: '9 am',
//      icons: Icons.wb_sunny,
//      temp: '18`',
//    ),
//    HourlyData(
//      dt: '10 am',
//      icons: Icons.wb_sunny,
//      temp: '18`',
//    ),
//    HourlyData(
//      dt: '11 am',
//      icons: Icons.wb_sunny,
//      temp: '18`',
//    ),
//    HourlyData(
//      dt: '12 am',
//      icons: Icons.wb_sunny,
//      temp: '18`',
//    ),
//    HourlyData(
//      dt: '13 pm',
//      icons: Icons.wb_sunny,
//      temp: '18`',
//    ),
//    HourlyData(
//      dt: '14 pm',
//      icons: Icons.wb_sunny,
//      temp: '18`',
//    ),
//    HourlyData(
//      dt: '15 pm',
//      icons: Icons.wb_sunny,
//      temp: '18`',
//    ),
//    HourlyData(
//      dt: '16 pm',
//      icons: Icons.wb_sunny,
//      temp: '18`',
//    ),
//    HourlyData(
//      dt: '17 pm',
//      icons: Icons.wb_sunny,
//      temp: '18`',
//    ),
//    HourlyData(
//      dt: '18 pm',
//      icons: Icons.wb_sunny,
//      temp: '18`',
//    ),
//    HourlyData(
//      dt: '19 pm',
//      icons: Icons.wb_sunny,
//      temp: '18`',
//    ),
//    HourlyData(
//      dt: '20 pm',
//      icons: Icons.wb_sunny,
//      temp: '18`',
//    ),
//    HourlyData(
//      dt: '21 pm',
//      icons: Icons.wb_sunny,
//      temp: '18`',
//    ),
//    HourlyData(
//      dt: '22 pm',
//      icons: Icons.wb_sunny,
//      temp: '18`',
//    ),
//    HourlyData(
//      dt: '23 pm',
//      icons: Icons.wb_sunny,
//      temp: '18`',
//    ),
//    HourlyData(
//      dt: '24 pm',
//      icons: Icons.wb_sunny,
//      temp: '18`',
//    ),
//    HourlyData(
//      dt: '1 am',
//      icons: Icons.wb_sunny,
//      temp: '18`',
//    ),
//    HourlyData(
//      dt: '2 am',
//      icons: Icons.wb_sunny,
//      temp: '18`',
//    ),
//    HourlyData(
//      dt: '3 am',
//      icons: Icons.wb_sunny,
//      temp: '18`',
//    ),
//    HourlyData(
//      dt: '4 am',
//      icons: Icons.wb_sunny,
//      temp: '18`',
//    ),
//    HourlyData(
//      dt: '5 am',
//      icons: Icons.wb_sunny,
//      temp: '18`',
//    ),
//  ];
//}
//
//class HourlyData {
//  var dt;
//  var icons;
//  var temp;
//
//  HourlyData({this.dt, this.icons, this.temp});
}
