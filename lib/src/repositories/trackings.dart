import 'package:dio/dio.dart';
import 'package:locker/src/models/prealert_model.dart';
import 'package:locker/src/models/tracking_model.dart';
import 'package:locker/src/repositories/urls.dart';
import 'package:locker/src/repositories/users.dart';

class TrackingRepository {
  final Dio _dio = Dio();
  final UserRepository _userRepository = UserRepository();

  Future getAll(String status) async {
    try {
      final userId = await _userRepository.getUserId();
      final token = await _userRepository.getToken();
      final response = await _dio.get(
        '$getAllPrealertUrl/$userId',
        options: Options(
          contentType: "application/json",
          headers: {"authorization": "Bearer $token"},
        ),
      );
      return TrackingModel.fromJson(response.data);
    } catch (e) {
      print('Error $e');
      return TrackingModel.withError(
          "No se encontraron dato / Problema con la conexión");
    }
  }

  Future savePrealert(Map<String, dynamic> data) async {
    try {
      final token = await _userRepository.getToken();
      final response = await _dio.post(
        savePrealertUrl,
        data: data,
        options: Options(
          contentType: "application/json",
          headers: {"authorization": "Bearer $token"},
          validateStatus: (statusCode) {
            return statusCode! < 500;
          },
        ),
      );
      return PrealertModel.fromJson(response.data);
    } catch (e) {
      print('Error $e');
      return e;
    }
  }
}
