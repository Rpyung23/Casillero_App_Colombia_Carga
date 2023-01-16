import 'package:dio/dio.dart';
import 'package:locker/src/models/document_detail_model.dart';
import 'package:locker/src/models/document_model.dart';
import 'package:locker/src/repositories/urls.dart';
import 'package:locker/src/repositories/users.dart';

class DocumentRepository {
  final Dio _dio = Dio();
  final UserRepository _userRepository = UserRepository();

  Future getAll(String? status) async {
    try {
      final userId = await _userRepository.getUserId();
      final token = await _userRepository.getToken();
      final response = await _dio.get(
        '$getAllDocumentUrl/$userId/$status',
        options: Options(
          contentType: "application/json",
          headers: {"authorization": "Bearer $token"},
        ),
      );
      return DocumentModel.fromJson(response.data);
    } catch (e) {
      print('Error $e');
      return "No se encontraron datos / Problema con la conexión";
    }
  }

  Future getDetail(String? numDocument) async {
    final token = await _userRepository.getToken();
    try {
      final response = await _dio.get(
        '$getDocumentDetailUrl/$numDocument/null',
        options: Options(
          contentType: "application/json",
          headers: {"authorization": "Bearer $token"},
        ),
      );
      // return response.data;
      return DocumentDetailModel.fromJson(response.data);
    } catch (e) {
      print('Error $e');
      return e.toString();
      // return "No se encontraron datos / Problema con la conexión";
    }
  }

  Future searchDocument(String numDocument) async {
    try {
      final token = await _userRepository.getToken();
      final response = await _dio.get(
        '$searchDocumentUrl/$numDocument',
        options: Options(
          contentType: "application/json",
          headers: {"authorization": "Bearer $token"},
        ),
      );
      return DocumentModel.fromJson(response.data);
    } catch (e) {
      print('Error $e');
      return "No se encontraron datos / Problema con la conexión";
    }
  }
}
