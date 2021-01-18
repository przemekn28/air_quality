import 'package:air_quality/const/const.dart';
import 'package:flutter/material.dart';

class MyCities extends StatefulWidget {
  MyCities({Key key}) : super(key: key);

  @override
  _MyCitiesState createState() => _MyCitiesState();
}

class _MyCitiesState extends State<MyCities> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: pagesAppBar(),
      body: Center(
        child: Text("Hello, my cities"),
      ),
    );
  }
}
