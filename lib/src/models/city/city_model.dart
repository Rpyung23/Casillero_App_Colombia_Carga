// To parse this JSON data, do
//
//     final city = cityFromMap(jsonString);

import 'dart:convert';

import 'data_city_model.dart';

class City {
  City({
    required this.code,
    required this.data,
  });

  int code;
  List<DataCity> data;

  factory City.fromJson(String str) => City.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory City.fromMap(Map<String, dynamic> json) => City(
        code: json["code"] == null ? null : json["code"],
        data: json["data"] == null
            ? []
            : List<DataCity>.from(json["data"].map((x) => DataCity.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "code": code == null ? null : code,
        "data": data == null
            ? null
            : List<dynamic>.from(data.map((x) => x.toMap())),
      };
}
