import 'dart:convert' as convert;
import 'dart:io';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:locker/src/constants.dart';
import 'package:locker/src/models/login/dataloginv2.dart';
import 'package:locker/src/repositories/urls.dart';
import 'package:locker/src/repositories/users.dart';

final headers = {
  'Content-Type': 'application/json; charset=UTF-8',
  'Accept': 'application/json',
  'Authorization': 'Bearer $tokenApi,'
};

final enconding = convert.Encoding.getByName('utf-8');

class FirebaseMessagingRepositories {
  static Future<void> updateTokenFirebase() async {
    // Create storage
    try {
      var storage = new FlutterSecureStorage();
      String? value = await storage.read(key: 'tokenFirebase');
      print(value);
      DataLoginv2 oD = await UserRepository.readPersistData('dataResponse');
      print("TOKEN FIREBASE (LOCALSTORE) : $value");
      var response = await http.post(Uri.parse(updateTokenFirebaseUrl),
          headers: headers,
          body: convert.jsonEncode({
            "emailClient": oD.user!.email!,
            "appMovilId": value,
            "agencyId": agencyId
          }),
          encoding: enconding);

      if (response.statusCode == 200) {
        //print(response.body);
        print("OK SEND TOKEN NOTIFICATION FIREBASE");
      } else {
        print("ERROR SEND TOKEN NOTIFICATION FIREBASE");
      }
    } catch (e) {
      print(e);
    }
  }
}
