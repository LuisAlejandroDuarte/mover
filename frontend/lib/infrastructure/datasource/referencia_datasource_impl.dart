import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../domain/domain.dart';
import '../../utils/authorize_interceptor.dart';

class ReferenciaDatasourceImpl extends ReferenciaDatasource {
  final Dio _dio;

  ReferenciaDatasourceImpl()
      : _dio = Dio(BaseOptions(
            baseUrl: dotenv.env['API_URL'] ?? 'http://localhost:3000')) {
    _dio.interceptors.add(AuthorizeInterceptor());
  }

  @override
  Future<List<Referencia>> getReferenciaByIdMarca(int idMarca) async {
    final response = await _dio
        .get('GetReferenciaByIdMarca', queryParameters: {'idMarca': idMarca});

    if (response.statusCode == 200) {
      List<dynamic> jsonList = response.data;
      return jsonList.map((json) => Referencia.fromJson(json)).toList();
    } else {
      throw Exception('Error al traer la lista de Referencias');
    }
  }
}
