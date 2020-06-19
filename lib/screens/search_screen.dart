import 'package:flutter/material.dart';
import 'package:myweatherapp/utilities/constants.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0x992D3044),
        body: Column(
          children: <Widget>[
            Container(
              color: Color(0x7035394F),
              alignment: Alignment.centerLeft,
              //color: Colors.red,
              height: MediaQuery.of(context).size.height * 0.1,
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: kIconColor,
                ),
                iconSize: MediaQuery.of(context).size.width * 0.08,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Container(
              //color: Colors.blue,
              margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 22.0),
              child: Material(
                borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(18.0), right: Radius.circular(25.0)),
                elevation: 0.0,
                color: Color(0xffC4C4C4),
                child: TextField(
                  style: TextStyle(
                    color: Color(0xff35394F),
                    fontSize: MediaQuery.of(context).size.width * 0.045,
                    fontFamily: 'SourceSansPro',
                  ),
                  cursorColor: Color(0xff35394F),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(left: 25.0, top: 12.0),
                    hintText: 'Search for a city',
                    hintStyle: TextStyle(
                      color: Color(0xff35394F),
                      fontSize: MediaQuery.of(context).size.width * 0.045,
                      fontFamily: 'SourceSansPro',
                    ),
                    suffixIcon: Material(
                      elevation: 5.0,
                      color: Color(0xffC4C4C4),
                      borderRadius: BorderRadius.circular(25.0),
                      child: Icon(
                        Icons.search,
                        size: MediaQuery.of(context).size.width * 0.09,
                        color: Color(0xff35394F),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
