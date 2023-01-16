import 'dart:convert';

class ProfileUserData {
  ProfileUserData({
    this.agencyId,
    this.firstName,
    this.lastName,
    this.documentNumber,
    this.locationId,
    this.locationName,
    this.address,
    this.postalCode,
    this.phone,
    this.isCompany,
  });

  int? agencyId;
  String? firstName;
  dynamic? lastName;
  String? documentNumber;
  int? locationId;
  String? locationName;
  String? address;
  dynamic? postalCode;
  dynamic? phone;
  int? isCompany;

  factory ProfileUserData.fromJson(String str) =>
      ProfileUserData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProfileUserData.fromMap(Map<String, dynamic> json) => ProfileUserData(
        agencyId: json["agencyId"] == null ? null : json["agencyId"],
        firstName: json["firstName"] == null ? null : json["firstName"],
        lastName: json["lastName"],
        documentNumber:
            json["documentNumber"] == null ? null : json["documentNumber"],
        locationId: json["locationId"] == null ? null : json["locationId"],
        locationName:
            json["locationName"] == null ? null : json["locationName"],
        address: json["address"] == null ? null : json["address"],
        postalCode: json["postalCode"],
        phone: json["phone"],
        isCompany: json["is_company"] == null ? null : json["is_company"],
      );

  Map<String, dynamic> toMap() => {
        "agencyId": agencyId == null ? null : agencyId,
        "firstName": firstName == null ? null : firstName,
        "lastName": lastName,
        "documentNumber": documentNumber == null ? null : documentNumber,
        "locationId": locationId == null ? null : locationId,
        "locationName": locationName == null ? null : locationName,
        "address": address == null ? null : address,
        "postalCode": postalCode,
        "phone": phone,
        "is_company": isCompany == null ? null : isCompany,
      };
}
