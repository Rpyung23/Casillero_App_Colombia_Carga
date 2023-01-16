class DocumentModel {
  List<Document>? data;
  String? error;

  DocumentModel({this.data});

  DocumentModel.withError(String errorMessage) {
    error = errorMessage;
  }

  DocumentModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null && json['data'].length > 0) {
      data = <Document>[];
      json['data'].forEach((v) {
        data!.add(new Document.fromJson(v));
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

class Document {
  int? id;
  String? color;
  String? contenido;
  String? description;
  int? documentoDetalleId;
  String? dateStatus;
  String? icon;
  String? numWarehouse;
  dynamic peso;
  String? tracking;

  Document({
    this.id,
    this.color,
    this.contenido,
    this.description,
    this.documentoDetalleId,
    this.dateStatus,
    this.icon,
    this.numWarehouse,
    this.peso,
    this.tracking,
  });

  Document.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    color = json['color'];
    contenido = json['contenido'];
    description = json['descripcion'];
    documentoDetalleId = json['documento_detalleId'];
    dateStatus = json['fecha_status'];
    icon = json['icon'];
    numWarehouse = json['num_warehouse'];
    peso = json['peso'];
    tracking = json['tracking'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['color'] = this.color;
    data['contenido'] = this.contenido;
    data['descripcion'] = this.description;
    data['documentoDetalleId'] = this.documentoDetalleId;
    data['dateStatus'] = this.dateStatus;
    data['icon'] = this.icon;
    data['numWarehouse'] = this.numWarehouse;
    data['peso'] = this.peso;
    data['tracking'] = this.tracking;
    return data;
  }
}
