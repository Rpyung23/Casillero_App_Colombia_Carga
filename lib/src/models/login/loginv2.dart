// To parse this JSON data, do
//
//     final loginV2 = loginV2FromMap(jsonString);

import 'dart:convert';

import 'package:locker/src/models/login/dataloginv2.dart';

class LoginV2 {
  LoginV2({
    this.code,
    this.message,
    this.data,
  });

  int? code;
  String? message;
  DataLoginv2? data;

  factory LoginV2.fromJson(String str) => LoginV2.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LoginV2.fromMap(Map<String, dynamic> json) => LoginV2(
        code: json["code"] == null ? null : json["code"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : DataLoginv2.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "code": code == null ? null : code,
        "message": message == null ? null : message,
        "data": data == null ? null : data!.toMap(),
      };
}
