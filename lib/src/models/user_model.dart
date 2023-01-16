class UserModel {
  List<Users>? data;
  String? error;

  UserModel({this.data});

  UserModel.withError(String errorMessage) {
    error = errorMessage;
  }

  UserModel.fromJson(Map<String, dynamic> json) {
    if (json != null) {
      data = <Users>[];
      print("EN EL MODELO: $json");
      // json.forEach((key, value) {
      //   print('EN EL FOREACH : $value');
      // });
      data!.add(new Users.fromJson(json));
      // json['data'].forEach((v) {
      //   data.add(new Users.fromJson(v));
      // });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Users {
  String? agencyId;
  String? casillero;
  String? clientId;
  String? email;
  String? document;
  String? id;
  String? nameFull;
  String? poBox;

  Users({
    this.agencyId,
    this.casillero,
    this.clientId,
    this.email,
    this.document,
    this.id,
    this.nameFull,
    this.poBox,
  });

  Users.fromJson(Map<String, dynamic> json) {
    print('EN EL USERS: ' + json['agencia_id']);
    agencyId = json['agencia_id'];
    clientId = json['cliente_id'];
    email = json['correo'];
    document = json['documento'];
    id = json['id'];
    nameFull = json['nombre_full'];
    poBox = json['po_box'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['agencia_id'] = this.agencyId;
    data['cliente_id'] = this.clientId;
    data['correo'] = this.email;
    data['id'] = this.id;
    data['nombre_full'] = this.nameFull;
    data['po_box'] = this.poBox;
    return data;
  }
}
