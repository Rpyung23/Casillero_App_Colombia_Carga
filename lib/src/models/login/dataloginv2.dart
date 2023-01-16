import 'dart:convert';
import 'package:locker/src/models/login/user.dart';

import 'agencia.dart';

class DataLoginv2 {
  DataLoginv2({
    this.user,
    this.agencia,
    this.accessToken,
    this.tokenType,
    this.expiresAt,
  });

  User? user;
  Agencia? agencia;
  String? accessToken;
  String? tokenType;
  DateTime? expiresAt;

  factory DataLoginv2.fromJson(String str) =>
      DataLoginv2.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DataLoginv2.fromMap(Map<String, dynamic> json) => DataLoginv2(
        user: json["user"] == null ? null : User.fromMap(json["user"]),
        agencia:
            json["agencia"] == null ? null : Agencia.fromMap(json["agencia"]),
        accessToken: json["access_token"] == null ? null : json["access_token"],
        tokenType: json["token_type"] == null ? null : json["token_type"],
        expiresAt: json["expires_at"] == null
            ? null
            : DateTime.parse(json["expires_at"]),
      );

  Map<String, dynamic> toMap() => {
        "user": user == null ? null : user!.toMap(),
        "agencia": agencia == null ? null : agencia!.toMap(),
        "access_token": accessToken == null ? null : accessToken,
        "token_type": tokenType == null ? null : tokenType,
        "expires_at": expiresAt == null ? null : expiresAt!.toIso8601String(),
      };
}
