import 'package:flutter/material.dart';

class ListItems {
  ListItems({this.dayText, this.weatherCondition, this.tempText});
  final String dayText;
  final IconData weatherCondition;
  final String tempText;
}

List<ListItems> items = [
  ListItems(
      dayText: 'Sunday', weatherCondition: Icons.wb_sunny, tempText: '18`'),
  ListItems(
      dayText: 'Monday', weatherCondition: Icons.wb_sunny, tempText: '18`'),
  ListItems(
      dayText: 'Tuesday', weatherCondition: Icons.wb_sunny, tempText: '18`'),
  ListItems(
      dayText: 'Wednesday', weatherCondition: Icons.wb_sunny, tempText: '18`'),
  ListItems(
      dayText: 'Thursday', weatherCondition: Icons.wb_sunny, tempText: '18`'),
  ListItems(
      dayText: 'Friday', weatherCondition: Icons.wb_sunny, tempText: '18`'),
  ListItems(
      dayText: 'Saturday', weatherCondition: Icons.wb_sunny, tempText: '18`'),
];
