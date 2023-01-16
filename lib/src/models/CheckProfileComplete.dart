// To parse this JSON data, do
//
//     final checkProfileComplete = checkProfileCompleteFromMap(jsonString);

import 'dart:convert';

class CheckProfileComplete {
  CheckProfileComplete({
    this.code,
    this.profileComplete,
  });

  int? code;
  int? profileComplete;

  factory CheckProfileComplete.fromJson(String str) =>
      CheckProfileComplete.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CheckProfileComplete.fromMap(Map<String, dynamic> json) =>
      CheckProfileComplete(
        code: json["code"],
        profileComplete: json["profile_complete "],
      );

  Map<String, dynamic> toMap() => {
        "code": code,
        "profile_complete ": profileComplete,
      };
}
