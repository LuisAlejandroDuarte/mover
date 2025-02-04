import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../domain/domain.dart';
import '../../utils/authorize_interceptor.dart';

class UbicacionDatasourceImpl extends UbicacionDatasource {
  final Dio _dio;

  UbicacionDatasourceImpl()
      : _dio = Dio(BaseOptions(
            baseUrl: dotenv.env['API_URL'] ?? 'http://localhost:3000')) {
    _dio.interceptors.add(AuthorizeInterceptor());
  }

  @override
  Future<int> createUbicacion(Ubicacion ubicacion) async {
    final ubicacionJson = ubicacion.toJson();
    final response = await _dio.post('crearUbicacion', data: ubicacionJson);

    if (response.statusCode == 200) {
      int ubicacionId = response.data;
      return ubicacionId;
    } else {
      throw Exception('Failed crear la ubicación');
    }
  }
}
