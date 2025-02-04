import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../../domain/domain.dart';
import '../../../utils/authorize_interceptor.dart';

class PaisDatasourceImpl extends PaisDatasource {
  final Dio _dio;

  PaisDatasourceImpl()
      : _dio = Dio(BaseOptions(
            baseUrl: dotenv.env['API_URL'] ?? 'http://localhost:3000')) {
    _dio.interceptors.add(AuthorizeInterceptor());
  }

  @override
  Future<Pais> getPaisByCodigo(String codigo) async {
    final response =
        await _dio.get('GetPaisByCodigo', queryParameters: {'codigo': codigo});

    if (response.statusCode == 200) {
      return Pais.fromJson(response.data);
    } else {
      throw Exception('Error al traer la lista de Carrocerias');
    }
  }
}
