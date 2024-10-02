import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../domain/domain.dart';
import '../../utils/authorize_interceptor.dart';

class CarroceriaDatasourceImpl extends CarroceriaDatasource {
  final Dio _dio;

  CarroceriaDatasourceImpl()
      : _dio = Dio(BaseOptions(
            baseUrl: dotenv.env['API_URL'] ?? 'http://localhost:3000')) {
    _dio.interceptors.add(AuthorizeInterceptor());
  }

  @override
  Future<List<Carroceria>> getCarroceriaByIdClase(int idClase) async {
    final response = await _dio
        .get('GetCarroceriaByIdClase', queryParameters: {'idClase': idClase});

    if (response.statusCode == 200) {
      List<dynamic> jsonList = response.data;
      return jsonList.map((json) => Carroceria.fromJson(json)).toList();
    } else {
      throw Exception('Error al traer la lista de Carrocerias');
    }
  }
}
