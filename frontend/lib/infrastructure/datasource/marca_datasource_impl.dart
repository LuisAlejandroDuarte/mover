import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../domain/domain.dart';
import '../../utils/authorize_interceptor.dart';

class MarcaDatasourceImpl extends MarcaDatasource {
  final Dio _dio;

  MarcaDatasourceImpl()
      : _dio = Dio(BaseOptions(
            baseUrl: dotenv.env['API_URL'] ?? 'http://localhost:3000')) {
    _dio.interceptors.add(AuthorizeInterceptor());
  }

  @override
  Future<List<Marca>> getMarcaByIdClase(int idClase) async {
    final response = await _dio
        .get('GetMarcaByIdClase', queryParameters: {'idClase': idClase});

    if (response.statusCode == 200) {
      List<dynamic> jsonList = response.data;
      return jsonList.map((json) => Marca.fromJson(json)).toList();
    } else {
      throw Exception('Error al traer la lista de Marcas');
    }
  }
}
