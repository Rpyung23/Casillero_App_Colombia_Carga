import 'dart:convert';

class DataCity {
  DataCity({
    this.id,
    this.name,
    this.prefijo,
    this.deptos,
    this.deptosId,
    this.pais,
    this.paisId,
    this.prefijoPais,
  });

  int? id;
  String? name;
  String? prefijo;
  String? deptos;
  int? deptosId;
  String? pais;
  int? paisId;
  String? prefijoPais;

  factory DataCity.fromJson(String str) => DataCity.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DataCity.fromMap(Map<String, dynamic> json) => DataCity(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        prefijo: json["prefijo"] == null ? null : json["prefijo"],
        deptos: json["deptos"] == null ? null : json["deptos"],
        deptosId: json["deptos_id"] == null ? null : json["deptos_id"],
        pais: json["pais"] == null ? null : json["pais"],
        paisId: json["pais_id"] == null ? null : json["pais_id"],
        prefijoPais: json["prefijo_pais"] == null ? null : json["prefijo_pais"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "prefijo": prefijo == null ? null : prefijo,
        "deptos": deptos == null ? null : deptos,
        "deptos_id": deptosId == null ? null : deptosId,
        "pais": pais == null ? null : pais,
        "pais_id": paisId == null ? null : paisId,
        "prefijo_pais": prefijoPais == null ? null : prefijoPais,
      };
}
