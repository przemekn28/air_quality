import 'dart:convert';

import 'package:air_quality/const/const.dart';
import 'package:air_quality/models/cities_model.dart';
import 'package:air_quality/repository/cities_repository.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'chosen_city_details.dart';

class AllCities extends StatefulWidget {
  AllCities({Key key}) : super(key: key);

  @override
  _AllCitiesState createState() => _AllCitiesState();
}

class _AllCitiesState extends State<AllCities> {
  List<Location> list;
  List<City> cities;
  bool loading;

  @override
  void initState() {
    super.initState();
    loading = true;
    CitiesRepository.getAllCities().then((getCities) {
      setState(() {
        cities = getCities;
        print("rozmiar listy: " + cities.length.toString());
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: pagesAppBar(title: "AirQuality"),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: cities == null ? 0 : cities.length,
          itemBuilder: (context, index) {
            City city = cities[index];
            return Card(
              color: Colors.blue[50],
              child: ListTile(
                onTap: (() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ChoosenCityDetails(city: city)),
                  );
                }),
                title: Text(city.name),
                subtitle: Text(city.commune.provinceName),
              ),
            );
          },
        ),
      ),
    );
  }
}
