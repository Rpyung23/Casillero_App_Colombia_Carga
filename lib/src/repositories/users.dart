import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart'
    as StorageSecure;
import 'package:locker/src/constants.dart';
import 'package:locker/src/models/CheckProfileComplete.dart';
import 'package:locker/src/models/login/dataloginv2.dart';
import 'package:locker/src/models/login/loginv2.dart';
import 'package:locker/src/repositories/firebase_messaging.dart';
import 'package:locker/src/repositories/urls.dart';

import '../models/checkResponse_model.dart';
import '../models/login/user.dart';
import '../models/profile_user_model.dart';

final _enconding = convert.Encoding.getByName('utf-8');
final _headers = {
  'Content-Type': 'application/json; charset=UTF-8',
  'Accept': 'application/json',
  'Authorization': 'Bearer $tokenApi,'
};

class UserRepository {
  final StorageSecure.FlutterSecureStorage storage =
      new StorageSecure.FlutterSecureStorage();
  final Dio _dio = Dio();

  static Future<bool> hasToken() async {
    StorageSecure.FlutterSecureStorage storage =
        new StorageSecure.FlutterSecureStorage();

    var value = await storage.read(key: 'token');
    if (value != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<String?> getToken() async => await storage.read(key: 'token');

  Future<String?> getUserId() async => await storage.read(key: 'user_id');

  Future<String?> getLoggedUser() async {
    final loggedUser = await storage.read(key: 'loggedUser');
    // final user = jsonDecode(loggedUser);
    // print(loggedUser);
    // final nameUser = loggedUser['primer_nombre'];
    return loggedUser;
  }

  Future<void> persistToken(String? token) async {
    await storage.write(key: 'token', value: token);
  }

  Future<void> persistData(String? data) async {
    await storage.write(key: 'dataResponse', value: data);
  }

  static Future<DataLoginv2> readPersistData(String? data) async {
    StorageSecure.FlutterSecureStorage storage =
        new StorageSecure.FlutterSecureStorage();
    var dataString = await storage.read(key: 'dataResponse');
    //print(dataString);
    if (dataString == null || dataString.isEmpty) {
      return new DataLoginv2();
    }
    return DataLoginv2.fromJson(dataString!);
  }

  Future<void> persistUserId(String userId) async {
    await storage.write(key: 'user_id', value: userId);
  }

  /*Future<void> persistData(Map<String, dynamic>? data) async {
    final dataString = convert.jsonEncode(data);
    await storage.write(key: 'loggedUser', value: dataString);
  }*/

  Future<void> deleteToken() async {
    storage.delete(key: 'token');
    storage.deleteAll();
  }

  Future<void> deleteLoggedUser() async {
    storage.delete(key: 'loggedUser');
    storage.deleteAll();
  }

  Future<dynamic> login(String username, String password) async {
    try {
      Response response = await _dio.post(
        loginUrl,
        data: {
          "email": username,
          "password": password,
          "agencia_id": agencyId,
          "remember_me": false
        },
        options: Options(validateStatus: (statusCode) {
          //print('statusCode: $statusCode');
          return statusCode! < 500;
        }),
      );
      return response.data;
    } catch (e) {
      //print('Error $e');
      return e;
    }
  }

  Future<LoginV2> registerUsuarioSocial(
      String email, String uid, String name) async {
    try {
      var response = await http.post(Uri.parse(registroEmailSocial),
          headers: headers,
          body: convert.jsonEncode({
            "agencyId": agencyId,
            "name": name,
            "email": email,
            "password": "",
            "uidFirebase": uid
          }),
          encoding: enconding);

      LoginV2 oL = LoginV2.fromJson(response.body);
      print(response.body);

      return oL;
    } catch (e) {
      print(e);
      return new LoginV2(code: 600, message: e.toString());
    }
  }

  Future<int> loginv2(String email, String password) async {
    var response = await http.post(Uri.parse(loginUrlv2),
        headers: headers,
        body: convert.jsonEncode({"email": email, "password": password}),
        encoding: enconding);

    if (response.statusCode == 200) {
      //print(response.body);
      LoginV2 oL = LoginV2.fromJson(response.body);
      if (oL.code == 200) {
        //print("JSON USER DATA REST");
        //print(oL.data!.toJson());
        await persistUserId(oL.data!.user!.id.toString());
        await persistData(oL.data!.toJson());
        await persistToken(oL.data!.accessToken!);
        return 200;
      }
      return oL.code!;
    }

    return response.statusCode;
  }

  static Future<CheckResponse> registerUsuarioEmail(
      String email_,
      String firstName_,
      String lastName_,
      String documentNumber_,
      int localizacionId_,
      String address_,
      int postalCode_,
      String phone_,
      bool terms_,
      bool isCompany_) async {
    try {
      var response = await http.post(Uri.parse(registroEmailFormulario),
          headers: _headers,
          encoding: _enconding,
          body: convert.jsonEncode({
            "agencyId": agencyId,
            "email": email_,
            "firstName": firstName_,
            "lastName": lastName_,
            "documentNumber": documentNumber_,
            "localizacionId": localizacionId_, // ID DE LA CIUDAD
            "address": address_,
            "postalCode": postalCode_, // CODIGO POSTAL O ZIP
            "phone": phone_, // CELULAR
            "terms": terms_, // ACEPTA TERMINOS Y CONDICIONES
            "isCompany": isCompany_ // ES EMPRESA
          }));
      print(response.body);
      CheckResponse oC = CheckResponse.fromJson(response.body);
      return oC;
    } catch (e) {
      print(e);
      return new CheckResponse(code: 600, message: e.toString());
    }
  }

  Future<CheckResponse> checkEmail(String email_) async {
    try {
      var data = await http.post(Uri.parse(checkUrlEmail),
          headers: _headers,
          encoding: _enconding,
          body: convert.jsonEncode({'agencyId': agencyId, 'email': email_}));
      var response = data.body;
      print(response);
      CheckResponse oC = CheckResponse.fromJson(response);
      return oC;
    } catch (e) {
      return new CheckResponse(code: 600, message: e.toString());
    }
  }

  Future<ProfileUser> readProfileUser() async {
    try {
      var idUser = await getUserId();
      print("ID USER : " + idUser.toString());
      var response = await http.post(Uri.parse(getProfileUser),
          headers: headers_,
          encoding: _enconding,
          body: convert.jsonEncode({"agencyId": agencyId, "id": idUser}));
      ProfileUser oP = ProfileUser.fromJson(response.body);
      print(response.body);
      return oP;
    } catch (e) {
      print(e.toString());
      return new ProfileUser(code: 600, message: e.toString());
    }
  }

  Future<CheckResponse> updateProfileUser(
      String firstname,
      String lasName,
      String documentNumber,
      int locationID,
      String adress,
      int codePostal,
      String phon) async {
    try {
      print("locationID : " + locationID.toString());

      var idUser = await getUserId();
      var reponse = await http.post(
          Uri.parse(updateProfileUserUrl + "/" + idUser.toString()),
          encoding: _enconding,
          headers: headers_,
          body: convert.jsonEncode({
            "agencyId": agencyId,
            "firstName": firstname,
            "lastName": lasName,
            "documentNumber": documentNumber,
            "locationId": locationID,
            "address": adress,
            "postalCode": codePostal,
            "phone": phon
          }));
      print(reponse.body);
      CheckResponse oU = CheckResponse.fromJson(reponse.body);
      return oU;
    } catch (e) {
      print(e);
      return new CheckResponse(code: 600, message: e.toString());
    }
  }

  Future<CheckProfileComplete> checkProfileComplete() async {
    try {
      var idUser = await getUserId();

      var datos = await http.post(Uri.parse(checkProfileCompleteUrl),
          headers: headers_,
          encoding: _enconding,
          body: convert.jsonEncode({"agencyId": agencyId, "id": idUser}));
      print(datos.body);

      return CheckProfileComplete.fromJson(datos.body);
    } catch (e) {
      print(e);
      return CheckProfileComplete(code: 400, profileComplete: 0);
    }
  }
}
