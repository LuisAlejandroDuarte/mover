import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../domain/domain.dart';
import '../../utils/authorize_interceptor.dart';

class ModeloDatasourceImpl extends ModeloDatasource {
  final Dio _dio;

  ModeloDatasourceImpl()
      : _dio = Dio(BaseOptions(
            baseUrl: dotenv.env['API_URL'] ?? 'http://localhost:3000')) {
    _dio.interceptors.add(AuthorizeInterceptor());
  }

  @override
  Future<List<Modelo>> getAllModelo() async {
    final response = await _dio.get('GetAllModelo');

    if (response.statusCode == 200) {
      List<dynamic> jsonList = response.data;
      return jsonList.map((json) => Modelo.fromJson(json)).toList();
    } else {
      throw Exception('Error al traer la lista de Modelos');
    }
  }
}
