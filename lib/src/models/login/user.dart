import 'dart:convert';
import 'package:locker/src/models/login/consignee.dart';

class User {
  User({
    this.id,
    this.name,
    this.email,
    this.actived,
    this.referido,
    this.agenciaId,
    this.consigneeId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.consignee,
  });

  int? id;
  String? name;
  String? email;
  int? actived;
  dynamic referido;
  int? agenciaId;
  int? consigneeId;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  Consignee? consignee;

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        email: json["email"] == null ? null : json["email"],
        actived: json["actived"] == null ? null : json["actived"],
        referido: json["referido"],
        agenciaId: json["agencia_id"] == null ? null : json["agencia_id"],
        consigneeId: json["consignee_id"] == null ? null : json["consignee_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        consignee: json["consignee"] == null
            ? null
            : Consignee.fromMap(json["consignee"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "email": email == null ? null : email,
        "actived": actived == null ? null : actived,
        "referido": referido,
        "agencia_id": agenciaId == null ? null : agenciaId,
        "consignee_id": consigneeId == null ? null : consigneeId,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "deleted_at": deletedAt,
        "consignee": consignee == null ? null : consignee!.toMap(),
      };
}
