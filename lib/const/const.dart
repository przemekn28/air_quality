import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final String allCitiesInfoURL =
    "http://api.gios.gov.pl/pjp-api/rest/station/findAll";

Widget pagesAppBar({String title}) {
  return AppBar(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title),
      ],
    ),
  );
}
