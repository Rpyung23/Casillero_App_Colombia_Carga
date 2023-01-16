import 'package:locker/src/models/tracking_model.dart';

class DocumentDetailModel {
  List<DocumentDetail>? data;
  late List<Trackings> trackings;
  String? error;

  DocumentDetailModel({this.data});

  DocumentDetailModel.withError(String errorMessage) {
    error = errorMessage;
  }

  DocumentDetailModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <DocumentDetail>[];
      json['data'].forEach((v) {
        data!.add(new DocumentDetail.fromJson(v));
      });
      if (json['trackings'] != null) {
        trackings = <Trackings>[];
        json['trackings'].forEach((v) {
          trackings.add(new Trackings.fromJson(v));
        });
      }
    }
  }

  // Map<dynamic, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   if (this.data != null) {
  //     data['data'] = this.data.map((v) => v.toJson()).toList();
  //   }
  //   return data;
  // }
}

class DocumentDetail {
  int? id;
  int? statusId;
  String? city;
  String? color;
  String? department;
  String? descriptionGeneral;
  String? status;
  String? dateStatus;
  String? icon;
  String? numConsolidated;
  String? numGuide;
  String? numWarehouse;
  String? country;
  dynamic weight;
  String? shipper;
  String? tracking;
  String? conveyor;
  String? conveyorGuide;
  String? conveyorUrlTracking;

  DocumentDetail({
    this.id,
    this.statusId,
    this.city,
    this.color,
    this.department,
    this.descriptionGeneral,
    this.status,
    this.dateStatus,
    this.icon,
    this.numConsolidated,
    this.numGuide,
    this.numWarehouse,
    this.country,
    this.weight,
    this.shipper,
    this.tracking,
    this.conveyor,
    this.conveyorGuide,
    this.conveyorUrlTracking,
  });

  DocumentDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    statusId = json['status_id'];
    city = json['ciudad'];
    color = json['color'];
    department = json['depto'];
    descriptionGeneral = json['descripcion_general'];
    status = json['estado'];
    dateStatus = json['fecha_status'];
    icon = json['icon'];
    numConsolidated = json['num_consolidado'];
    numGuide = json['num_guia'];
    numWarehouse = json['num_warehouse'];
    country = json['pais'];
    weight = json['peso'];
    shipper = json['shipper'];
    tracking = json['tracking'];
    conveyor = json['transportadora'];
    conveyorGuide = json['transportadora_guia'];
    conveyorUrlTracking = json['transportadora_url_rastreo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['status_id'] = this.statusId;
    data['ciudad'] = this.city;
    data['color'] = this.color;
    data['depto'] = this.department;
    data['descripcion_general'] = this.descriptionGeneral;
    data['estado'] = this.status;
    data['fecha_status'] = this.dateStatus;
    data['icon'] = this.icon;
    data['num_consolidado'] = this.numConsolidated;
    data['num_guia'] = this.numGuide;
    data['num_warehouse'] = this.numWarehouse;
    data['pais'] = this.country;
    data['peso'] = this.weight;
    data['shipper'] = this.shipper;
    data['tracking'] = this.tracking;
    data['transportadora'] = this.conveyor;
    data['transportadora_guia'] = this.conveyorGuide;
    data['transportadora_url_rastreo'] = this.conveyorUrlTracking;
    return data;
  }
}
