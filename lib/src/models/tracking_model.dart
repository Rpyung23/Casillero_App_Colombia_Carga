class TrackingModel {
  List<Trackings>? data;
  String? error;

  TrackingModel({this.data});

  TrackingModel.withError(String errorMessage) {
    error = errorMessage;
  }

  TrackingModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Trackings>[];
      json['data'].forEach((v) {
        data!.add(new Trackings.fromJson(v));
      });
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

class Trackings {
  int? id;
  int? agencyId;
  String? agency;
  String? consignee;
  int? consigneeId;
  String? content;
  String? email;
  String? createdAt;
  int? declarated;
  String? deletedAt;
  int? dispatch;
  String? instruction;
  int? received;
  String? phone;
  String? numTracking;
  String? updatedAt;

  Trackings({
    this.id,
    this.agencyId,
    this.agency,
    this.consignee,
    this.consigneeId,
    this.content,
    this.email,
    this.createdAt,
    this.declarated,
    this.deletedAt,
    this.dispatch,
    this.instruction,
    this.received,
    this.phone,
    this.numTracking,
    this.updatedAt,
  });

  Trackings.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    agencyId = json['agencia_id'];
    agency = json['agencia'];
    consignee = json['consignee'];
    consigneeId = json['consignee_id'];
    content = json['contenido'];
    email = json['correo'];
    createdAt = json['created_at'];
    declarated = json['declarado'];
    deletedAt = json['deleted_at'];
    dispatch = json['despachar'];
    instruction = json['instruccion'];
    received = json['recibido'];
    phone = json['telefono'];
    numTracking = json['tracking'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['agencyId'] = this.agencyId;
    data['agency'] = this.agency;
    data['consignee'] = this.consignee;
    data['consigneeId'] = this.consigneeId;
    data['content'] = this.content;
    data['email'] = this.email;
    data['createdAt'] = this.createdAt;
    data['declarated'] = this.declarated;
    data['deletedAt'] = this.deletedAt;
    data['dispatch'] = this.dispatch;
    data['instruction'] = this.instruction;
    data['received'] = this.received;
    data['phone'] = this.phone;
    data['tracking'] = this.numTracking;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
