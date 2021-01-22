import 'package:air_quality/const/const.dart';
import 'package:air_quality/models/cities_model.dart';
import 'package:air_quality/repository/cities_repository.dart';
import 'package:flutter/material.dart';

class ChoosenCityDetails extends StatefulWidget {
  final City city;
  ChoosenCityDetails({Key key, @required this.city}) : super(key: key);

  @override
  _ChoosenCityDetailsState createState() => _ChoosenCityDetailsState();
}

class _ChoosenCityDetailsState extends State<ChoosenCityDetails> {
  List<Location> locations;

  @override
  void initState() {
    super.initState();
    CitiesRepository.getLocationsForCity(widget.city.id).then((getLocations) {
      setState(() {
        locations = getLocations;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: pagesAppBar(title: widget.city.name),
      body: Container(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(title: locations[index].addressStreet),
            );
          },
        ),
      ),
    );
  }
}
