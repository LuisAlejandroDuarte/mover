import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../domain/domain.dart';
import '../../utils/authorize_interceptor.dart';

class EstadoOfertaDatasourceImpl extends EstadoOfertaDatasource {
  final Dio _dio;

  EstadoOfertaDatasourceImpl()
      : _dio = Dio(BaseOptions(
            baseUrl: dotenv.env['API_URL'] ?? 'http://localhost:3000')) {
    _dio.interceptors.add(AuthorizeInterceptor());
  }

  @override
  Future<List<EstadoOferta>> getAllEstadoOferta() async {
    final response = await _dio.get('GetAllEstadoOferta');

    if (response.statusCode == 200) {
      List<dynamic> jsonList = response.data;
      return jsonList.map((json) => EstadoOferta.fromJson(json)).toList();
    } else {
      throw Exception('Error al traer la lista de EstadoOfertas');
    }
  }
}
