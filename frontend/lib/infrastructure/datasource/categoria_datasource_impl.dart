import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../domain/domain.dart';
import '../../utils/authorize_interceptor.dart';

class CategoriaDatasourceImpl extends CategoriaDatasource {
  final Dio _dio;

  CategoriaDatasourceImpl()
      : _dio = Dio(BaseOptions(
            baseUrl: dotenv.env['API_URL'] ?? 'http://localhost:3000')) {
    _dio.interceptors.add(AuthorizeInterceptor());
  }

  @override
  Future<List<Categorias>> getAllCategorias() async {
    final response = await _dio.get('GetAllCategoria');

    if (response.statusCode == 200) {
      List<dynamic> jsonList = response.data;
      return jsonList.map((json) => Categorias.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load tipo identificacion');
    }
  }
}
