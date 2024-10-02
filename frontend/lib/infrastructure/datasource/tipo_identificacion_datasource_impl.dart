import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:frontend/utils/authorize_interceptor.dart';

import '../../domain/domain.dart';

class TipoIdentificacionDataSourceImpl implements TipoIdentificacionDataSource {
  final Dio _dio;

  TipoIdentificacionDataSourceImpl()
      : _dio = Dio(BaseOptions(
            baseUrl: dotenv.env['API_URL'] ?? 'http://localhost:3000')) {
    _dio.interceptors.add(AuthorizeInterceptor());
  }

  @override
  Future<List<TipoIdentificacion>> getAll() async {
    final response = await _dio.get('ListarTipoIdentificacion');

    if (response.statusCode == 200) {
      List<dynamic> jsonList = response.data;
      return jsonList.map((json) => TipoIdentificacion.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load tipo identificacion');
    }
  }
}
