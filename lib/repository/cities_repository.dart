//import 'dart:convert';

import 'package:air_quality/const/const.dart';
import 'package:air_quality/models/cities_model.dart';
//import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
//import 'package:dio/dio.dart';

class CitiesRepository {
  static List<Location> listLocation;

  static Future<List<City>> getAllCities() async {
    final response = await http.get(allCitiesInfoURL);
    List<City> cities = new List<City>();
    try {
      if (response.statusCode == 200) {
        final List<Location> locations = locationFromJson(response.body);
        listLocation = locations;
        // sorting ascending by city name
        listLocation.sort((a, b) => a.city.name.compareTo(b.city.name));

        String lastCity = "";
        for (int i = 0; i < listLocation.length; i++) {
          if (lastCity != listLocation[i].city.name) {
            cities.add(listLocation[i].city);
            lastCity = listLocation[i].city.name;
          }
        }
        return cities;
      } else {
        return List<City>();
      }
    } catch (e) {
      return List<City>();
    }
  }

  static Future<List<Location>> getLocationsForCity(int cityId) async {
    List<Location> choosenCityLocations = new List<Location>();

    bool alreadyAdded = false;
    for (int i = 0; i < listLocation.length; i++) {
      if (listLocation[i].city.id == cityId) {
        choosenCityLocations.add(listLocation[i]);
        alreadyAdded = true;
      } else {
        if (alreadyAdded && listLocation[i].city.id != cityId) {
          break;
        }
      }
    }
    return choosenCityLocations;
  }
}
