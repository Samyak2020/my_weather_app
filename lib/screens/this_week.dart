import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myweatherapp/utilities/constants.dart';
import 'package:myweatherapp/models/weekly_list_items.dart';

class ThisWeek extends StatelessWidget {
  ThisWeek({this.thisWeekWeatherData});

  final thisWeekWeatherData;

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
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.search,
                color: kTextColor,
              ),
              iconSize: MediaQuery.of(context).size.width * 0.09,
              onPressed: () {},
            ),
          ],
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
                      padding: EdgeInsets.only(top: 25.0, bottom: 15.0),
                      // color: Colors.red,
                      child: Text(
                        'This Week',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.07,
                          color: kTextColor,
                          fontFamily: 'PlayfairDisplay',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.070),
                        // color: Colors.red,
                        height: MediaQuery.of(context).size.height * 0.08,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              items[index].dayText,
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
                                Icon(
                                  items[index].weatherCondition,
                                  size: MediaQuery.of(context).size.height *
                                      0.030,
                                  color: kIconColor,
                                ),
                                SizedBox(width: 25.0),
                                Text(
                                  items[index].tempText,
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
              bottom: MediaQuery.of(context).size.width * 0.22,
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
              bottom: MediaQuery.of(context).size.height * 0.035,
              left: MediaQuery.of(context).size.width * 0.12,
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
