import 'dart:convert';

class Agencia {
  Agencia({
    this.id,
    this.descripcion,
    this.responsable,
    this.direccion,
    this.localizacionId,
    this.zip,
    this.telefono,
    this.whatsapp,
    this.observacion,
    this.logo,
    this.tipoAgencia,
    this.prefijoPobox,
    this.fileId,
    this.email,
    this.emailCc,
    this.emailHost,
    this.emailPort,
    this.emailEncriptyon,
    this.emailUsername,
    this.emailPassword,
    this.emailPaypal,
    this.compraPorcentajeComision,
    this.compraMinimaComision,
    this.compraRangoComision,
    this.compraRangoComision2,
    this.zopim,
    this.usarMailChimp,
    this.usarZopim,
    this.amazonId,
    this.terminosCondiciones,
    this.usarPaypal,
    this.url,
    this.urlTerms,
    this.urlCasillero,
    this.urlRegistro,
    this.urlRastreo,
    this.urlPrealerta,
    this.urlRegistroCasillero,
    this.unitMeasurementJson,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  int? id;
  String? descripcion;
  String? responsable;
  String? direccion;
  int? localizacionId;
  String? zip;
  String? telefono;
  dynamic whatsapp;
  dynamic observacion;
  String? logo;
  int? tipoAgencia;
  String? prefijoPobox;
  int? fileId;
  String? email;
  dynamic emailCc;
  String? emailHost;
  dynamic emailPort;
  dynamic emailEncriptyon;
  dynamic emailUsername;
  dynamic emailPassword;
  dynamic emailPaypal;
  dynamic compraPorcentajeComision;
  dynamic compraMinimaComision;
  dynamic compraRangoComision;
  dynamic compraRangoComision2;
  dynamic zopim;
  int? usarMailChimp;
  int? usarZopim;
  dynamic amazonId;
  dynamic terminosCondiciones;
  int? usarPaypal;
  String? url;
  String? urlTerms;
  dynamic urlCasillero;
  dynamic urlRegistro;
  dynamic urlRastreo;
  String? urlPrealerta;
  String? urlRegistroCasillero;
  String? unitMeasurementJson;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;

  factory Agencia.fromJson(String str) => Agencia.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Agencia.fromMap(Map<String, dynamic> json) => Agencia(
        id: json["id"] == null ? null : json["id"],
        descripcion: json["descripcion"] == null ? null : json["descripcion"],
        responsable: json["responsable"] == null ? null : json["responsable"],
        direccion: json["direccion"] == null ? null : json["direccion"],
        localizacionId:
            json["localizacion_id"] == null ? null : json["localizacion_id"],
        zip: json["zip"] == null ? null : json["zip"],
        telefono: json["telefono"] == null ? null : json["telefono"],
        whatsapp: json["whatsapp"],
        observacion: json["observacion"],
        logo: json["logo"] == null ? null : json["logo"],
        tipoAgencia: json["tipo_agencia"] == null ? null : json["tipo_agencia"],
        prefijoPobox:
            json["prefijo_pobox"] == null ? null : json["prefijo_pobox"],
        fileId: json["file_id"] == null ? null : json["file_id"],
        email: json["email"] == null ? null : json["email"],
        emailCc: json["email_cc"],
        emailHost: json["email_host"] == null ? null : json["email_host"],
        emailPort: json["email_port"],
        emailEncriptyon: json["email_encriptyon"],
        emailUsername: json["email_username"],
        emailPassword: json["email_password"],
        emailPaypal: json["email_paypal"],
        compraPorcentajeComision: json["compra_porcentaje_comision"],
        compraMinimaComision: json["compra_minima_comision"],
        compraRangoComision: json["compra_rango_comision"],
        compraRangoComision2: json["compra_rango_comision2"],
        zopim: json["zopim"],
        usarMailChimp:
            json["usar_mail_chimp"] == null ? null : json["usar_mail_chimp"],
        usarZopim: json["usar_zopim"] == null ? null : json["usar_zopim"],
        amazonId: json["amazon_id"],
        terminosCondiciones: json["terminos_condiciones"],
        usarPaypal: json["usar_paypal"] == null ? null : json["usar_paypal"],
        url: json["url"] == null ? null : json["url"],
        urlTerms: json["url_terms"] == null ? null : json["url_terms"],
        urlCasillero: json["url_casillero"],
        urlRegistro: json["url_registro"],
        urlRastreo: json["url_rastreo"],
        urlPrealerta:
            json["url_prealerta"] == null ? null : json["url_prealerta"],
        urlRegistroCasillero: json["url_registro_casillero"] == null
            ? null
            : json["url_registro_casillero"],
        unitMeasurementJson: json["unit_measurement_json"] == null
            ? null
            : json["unit_measurement_json"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "descripcion": descripcion == null ? null : descripcion,
        "responsable": responsable == null ? null : responsable,
        "direccion": direccion == null ? null : direccion,
        "localizacion_id": localizacionId == null ? null : localizacionId,
        "zip": zip == null ? null : zip,
        "telefono": telefono == null ? null : telefono,
        "whatsapp": whatsapp,
        "observacion": observacion,
        "logo": logo == null ? null : logo,
        "tipo_agencia": tipoAgencia == null ? null : tipoAgencia,
        "prefijo_pobox": prefijoPobox == null ? null : prefijoPobox,
        "file_id": fileId == null ? null : fileId,
        "email": email == null ? null : email,
        "email_cc": emailCc,
        "email_host": emailHost == null ? null : emailHost,
        "email_port": emailPort,
        "email_encriptyon": emailEncriptyon,
        "email_username": emailUsername,
        "email_password": emailPassword,
        "email_paypal": emailPaypal,
        "compra_porcentaje_comision": compraPorcentajeComision,
        "compra_minima_comision": compraMinimaComision,
        "compra_rango_comision": compraRangoComision,
        "compra_rango_comision2": compraRangoComision2,
        "zopim": zopim,
        "usar_mail_chimp": usarMailChimp == null ? null : usarMailChimp,
        "usar_zopim": usarZopim == null ? null : usarZopim,
        "amazon_id": amazonId,
        "terminos_condiciones": terminosCondiciones,
        "usar_paypal": usarPaypal == null ? null : usarPaypal,
        "url": url == null ? null : url,
        "url_terms": urlTerms == null ? null : urlTerms,
        "url_casillero": urlCasillero,
        "url_registro": urlRegistro,
        "url_rastreo": urlRastreo,
        "url_prealerta": urlPrealerta == null ? null : urlPrealerta,
        "url_registro_casillero":
            urlRegistroCasillero == null ? null : urlRegistroCasillero,
        "unit_measurement_json":
            unitMeasurementJson == null ? null : unitMeasurementJson,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "deleted_at": deletedAt,
      };
}
