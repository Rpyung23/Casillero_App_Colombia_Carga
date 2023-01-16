import 'dart:convert';

class Consignee {
  Consignee({
    this.id,
    this.agenciaId,
    this.primerNombre,
    this.correo,
    this.casillero,
    this.appMovilId,
    this.celular,
    this.poBox,
    this.createdAt,
  });

  int? id;
  int? agenciaId;
  String? primerNombre;
  String? correo;
  int? casillero;
  dynamic appMovilId;
  dynamic celular;
  String? poBox;
  DateTime? createdAt;

  factory Consignee.fromJson(String str) => Consignee.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Consignee.fromMap(Map<String, dynamic> json) => Consignee(
        id: json["id"] == null ? null : json["id"],
        agenciaId: json["agencia_id"] == null ? null : json["agencia_id"],
        primerNombre:
            json["primer_nombre"] == null ? null : json["primer_nombre"],
        correo: json["correo"] == null ? null : json["correo"],
        casillero: json["casillero"] == null ? null : json["casillero"],
        appMovilId: json["app_movil_id"],
        celular: json["celular"],
        poBox: json["po_box"] == null ? null : json["po_box"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "agencia_id": agenciaId == null ? null : agenciaId,
        "primer_nombre": primerNombre == null ? null : primerNombre,
        "correo": correo == null ? null : correo,
        "casillero": casillero == null ? null : casillero,
        "app_movil_id": appMovilId,
        "celular": celular,
        "po_box": poBox == null ? null : poBox,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
      };
}
