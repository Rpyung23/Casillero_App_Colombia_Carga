// To parse this JSON data, do
//
//     final profileUser = profileUserFromMap(jsonString);

import 'dart:convert';

import 'package:locker/src/models/profile_user_data_model.dart';

class ProfileUser {
  ProfileUser({
    required this.code,
    required this.message,
    this.data,
  });

  int code;
  String message;
  List<ProfileUserData>? data;

  factory ProfileUser.fromJson(String str) =>
      ProfileUser.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProfileUser.fromMap(Map<String, dynamic> json) => ProfileUser(
        code: json["code"] == null ? null : json["code"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null
            ? null
            : List<ProfileUserData>.from(
                json["data"].map((x) => ProfileUserData.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "code": code == null ? null : code,
        "message": message == null ? null : message,
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}
