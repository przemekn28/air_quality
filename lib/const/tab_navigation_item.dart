import 'package:air_quality/views/all_cities.dart';
import 'package:air_quality/views/my_cities.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabNavigationItem {
  final Widget page;
  final String title;
  final Icon icon;

  TabNavigationItem(
      {@required this.page, @required this.title, @required this.icon});

  static List<TabNavigationItem> get items => [
        TabNavigationItem(
          page: MyCities(),
          title: "My Cities",
          icon: Icon(Icons.location_city),
        ),
        TabNavigationItem(
          page: AllCities(),
          title: "All Cities",
          icon: Icon(Icons.all_inbox),
        )
      ];
}
