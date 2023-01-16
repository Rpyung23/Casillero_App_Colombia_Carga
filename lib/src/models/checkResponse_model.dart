// To parse this JSON data, do
//
//     final checkResponse = checkResponseFromMap(jsonString);

import 'dart:convert';

import 'data_check_email.dart';

class CheckResponse {
  CheckResponse(
      {required this.code,
      this.message,
      this.accessToken,
      this.tokenType,
      this.tokenExpiresAt,
      this.id,
      this.data});

  int code;
  String? message;
  String? accessToken;
  String? tokenType;
  DateTime? tokenExpiresAt;
  int? id;
  DataCheckEmail? data;

  factory CheckResponse.fromJson(String str) =>
      CheckResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CheckResponse.fromMap(Map<String, dynamic> json) => CheckResponse(
      code: json["code"] == null ? null : json["code"],
      message: json["message"] == null ? null : json["message"],
      accessToken: json["access_token"] == null ? null : json["access_token"],
      id: json["id"] == null ? null : json["id"],
      tokenType: json["token_type"] == null ? null : json["token_type"],
      tokenExpiresAt: json["token_expires_at"] == null
          ? null
          : DateTime.parse(json["token_expires_at"]),
      data: json["data"] == null ? null : DataCheckEmail.fromMap(json["data"]));

  Map<String, dynamic> toMap() => {
        "code": code == null ? null : code,
        "message": message == null ? null : message,
        "access_token": accessToken == null ? null : accessToken,
        "token_type": tokenType == null ? null : tokenType,
        "id": id == null ? null : id,
        "data": data == null ? null : data!.toMap(),
        "token_expires_at":
            tokenExpiresAt == null ? null : tokenExpiresAt!.toIso8601String(),
      };
}
