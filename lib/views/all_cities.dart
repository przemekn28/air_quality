import 'package:air_quality/const/const.dart';
import 'package:air_quality/models/cities_model.dart';
import 'package:air_quality/repository/cities_repository.dart';
import 'package:flutter/material.dart';

class AllCities extends StatefulWidget {
  AllCities({Key key}) : super(key: key);

  @override
  _AllCitiesState createState() => _AllCitiesState();
}

class _AllCitiesState extends State<AllCities> {
  List<CitiesModel> list;
  //final items = List<String>.generate(10, (i) => "Item $i");

  @override
  void setState(fn) {
    CitiesRepository().getData();
    list = CitiesRepository().list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: pagesAppBar(),
      body: SingleChildScrollView(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: list.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('${list[index].city}'),
            );
          },
        ),
      ),
    );
  }
}
