import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myweatherapp/utilities/constants.dart';
import 'package:myweatherapp/models/weekly_list_items.dart';

class ThisWeek extends StatefulWidget {
  ThisWeek({this.thisWeekWeatherData});

  final thisWeekWeatherData;

  @override
  _ThisWeekState createState() => _ThisWeekState();
}

class _ThisWeekState extends State<ThisWeek> {
  Map daily;
  List dailyData;
  DateFormat dateFormat = DateFormat('EEEE');
  var timeData, timeNow;

  Future getDailyData() async {
    daily = widget.thisWeekWeatherData;
    setState(() {
      dailyData = daily['daily'];
      //print('asda');
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDailyData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Color(0xff2D3044),
        appBar: AppBar(
          backgroundColor: Color(0xff2D3044),
          centerTitle: true,
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: kTextColor,
            ),
            iconSize: MediaQuery.of(context).size.width * 0.09,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'Weathery',
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.06,
              color: kTextColor,
              fontFamily: 'PlayfairDisplay',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.width * 0.05),
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50.0),
                  topRight: Radius.circular(50.0),
                ),
              ),
              child: Column(
                children: <Widget>[
                  Center(
                    child: Container(
                      padding: EdgeInsets.only(top: 20.0, bottom: 10.0),
                      //color: Colors.red,
                      child: Text(
                        'This Week',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.065,
                          color: kTextColor,
                          fontFamily: 'PlayfairDisplay',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.065,
                        vertical: MediaQuery.of(context).size.width * 0.025),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Week-Days',
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.055,
                            color: kTextColor,
                            fontFamily: 'PlayfairDisplay',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              'Min', //flutter upgrade
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.052,
                                color: kTextColor,
                                fontFamily: 'PlayfairDisplay',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                                width:
                                    MediaQuery.of(context).size.height * 0.03),
                            Text(
                              'Max',
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.052,
                                color: kTextColor,
                                fontFamily: 'PlayfairDisplay',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: dailyData == null ? 0 : dailyData.length - 1,
                    itemBuilder: (context, index) {
                      timeData = dailyData[index]['dt'];
                      timeNow = dateFormat.format(
                          DateTime.fromMillisecondsSinceEpoch(timeData * 1000));
                      return Container(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.070),
                        //color: Colors.red,
                        height: MediaQuery.of(context).size.height * 0.08,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              timeNow.toString(),
                              style: TextStyle(
                                color: kTextColor,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.028,
                                fontFamily: 'SourceSansPro',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                Image(
                                  image: NetworkImage(
                                      "http://openweathermap.org/img/wn/" +
                                          dailyData[index]['weather'][0]
                                              ['icon'] +
                                          "@2x.png"),
                                  color: kIconColor,
                                ),
                                SizedBox(
                                    width: MediaQuery.of(context).size.height *
                                        0.045),
                                Text(
                                  '${dailyData[index]['temp']['min'].toInt()}°',
                                  style: TextStyle(
                                    color: kTextColor,
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.028,
                                    fontFamily: 'SourceSansPro',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(
                                    width: MediaQuery.of(context).size.height *
                                        0.045),
                                Text(
                                  '${dailyData[index]['temp']['max'].toInt()}°',
                                  style: TextStyle(
                                    color: kTextColor,
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.028,
                                    fontFamily: 'SourceSansPro',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.018,
              left: MediaQuery.of(context).size.width * 0.44,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  color: Color(0xff0C2BEB2),
                ),
                child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                    width: MediaQuery.of(context).size.width * 0.15),
              ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.width * 0.18,
              left: MediaQuery.of(context).size.width * 0.34,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  color: Color(0xff0C2BEB2),
                ),
                child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                    width: MediaQuery.of(context).size.width * 0.35),
              ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.028,
              left: MediaQuery.of(context).size.width * 0.14,
              child: Text(
                ' Have a great week ahead ᠅',
                style: TextStyle(
                  color: kTextColor,
                  fontSize: MediaQuery.of(context).size.height * 0.032,
                  //fontWeight: FontWeight.w600,
                  fontFamily: 'Kalam',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
