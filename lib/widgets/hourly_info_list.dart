import 'package:flutter/material.dart';

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
      itemCount: 24,
      itemBuilder: (context, index) {
        return getListItems();
      },
    );
    return listView;
  }

  Widget getListItems() {
    var columnItems = Container(
      margin: EdgeInsets.fromLTRB(15.0, 15.0, 0.0, 15.0),
      width: 56.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.0),
        color: Color(0xff434761),
      ),
      child: ListItem(icons: Icons.wb_sunny, hourText: '6 AM', tempText: '18`'),
    );
    return columnItems;
  }
}

class ListItem extends StatelessWidget {
  ListItem({this.hourText, this.icons, this.tempText});

  final String hourText;
  final IconData icons;
  final String tempText;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(
          hourText,
          style: TextStyle(
            fontSize: 15.0,
            color: Colors.white70,
            fontFamily: 'SourceSansPro',
            fontWeight: FontWeight.w600,
          ),
        ),
        Icon(
          icons,
          color: Colors.white70,
        ),
        Text(
          tempText,
          style: TextStyle(
            fontSize: 17.0,
            color: Colors.white70,
            fontFamily: 'SourceSansPro',
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
