import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../../domain/domain.dart';
import '../../../utils/authorize_interceptor.dart';

class CiudadDatasourceImpl extends CiudadDatasource {
  final Dio _dio;

  CiudadDatasourceImpl()
      : _dio = Dio(BaseOptions(
            baseUrl: dotenv.env['API_URL'] ?? 'http://localhost:3000')) {
    _dio.interceptors.add(AuthorizeInterceptor());
  }

  @override
  Future<List<Ciudad>> getCiudadByIdDepartamento(int departamentoId) async {
    final response = await _dio.get('GetCiudadByIdDepartamento',
        queryParameters: {'departamentoId': departamentoId});

    if (response.statusCode == 200) {
      List<dynamic> jsonList = response.data;
      return jsonList.map((json) => Ciudad.fromJson(json)).toList();
    } else {
      throw Exception('Error al traer la lista de Ciudad');
    }
  }
}
