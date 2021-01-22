// To parse this JSON data, do
//
//     final location = locationFromJson(jsonString);

import 'dart:convert';

List<Location> locationFromJson(String str) =>
    List<Location>.from(json.decode(str).map((x) => Location.fromJson(x)));

String locationToJson(List<Location> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Location {
  Location({
    this.id,
    this.stationName,
    this.gegrLat,
    this.gegrLon,
    this.city,
    this.addressStreet,
  });

  int id;
  String stationName;
  String gegrLat;
  String gegrLon;
  City city;
  dynamic addressStreet;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        id: json["id"],
        stationName: json["stationName"],
        gegrLat: json["gegrLat"],
        gegrLon: json["gegrLon"],
        city: City.fromJson(json["city"]),
        addressStreet: json["addressStreet"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "stationName": stationName,
        "gegrLat": gegrLat,
        "gegrLon": gegrLon,
        "city": city.toJson(),
        "addressStreet": addressStreet,
      };
}

class City {
  City({
    this.id,
    this.name,
    this.commune,
  });

  int id;
  String name;
  Commune commune;

  factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["id"],
        name: json["name"],
        commune: Commune.fromJson(json["commune"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "commune": commune.toJson(),
      };
}

class Commune {
  Commune({
    this.communeName,
    this.districtName,
    this.provinceName,
  });

  String communeName;
  String districtName;
  String provinceName;

  factory Commune.fromJson(Map<String, dynamic> json) => Commune(
        communeName: json["communeName"],
        districtName: json["districtName"],
        provinceName: json["provinceName"],
      );

  Map<String, dynamic> toJson() => {
        "communeName": communeName,
        "districtName": districtName,
        "provinceName": provinceName,
      };
}
