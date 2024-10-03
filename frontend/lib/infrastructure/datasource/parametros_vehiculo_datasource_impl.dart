import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../domain/domain.dart';
import '../../utils/authorize_interceptor.dart';

class ParametrosVehiculoDatasourceImpl extends ParametrosVehiculoDatasource {
  final Dio _dio;

  ParametrosVehiculoDatasourceImpl()
      : _dio = Dio(BaseOptions(
            baseUrl: dotenv.env['API_URL'] ?? 'http://localhost:3000')) {
    _dio.interceptors.add(AuthorizeInterceptor());
  }

  @override
  Future<List<ParametrosVehiculo>> getAllParametrosVehiculo() async {
    final response = await _dio.get('GetAllParametrosVehiculo');

    if (response.statusCode == 200) {
      List<dynamic> jsonList = response.data;
      return jsonList.map((json) => ParametrosVehiculo.fromJson(json)).toList();
    } else {
      throw Exception('Error al traer la lista de ParametrosVehiculos');
    }
  }
}
