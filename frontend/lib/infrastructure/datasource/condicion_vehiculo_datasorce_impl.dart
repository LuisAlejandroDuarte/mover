import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../domain/domain.dart';
import '../../utils/authorize_interceptor.dart';

class CondicionVehiculoDatasourceImpl extends CondicionVehiculoDatasource {
  final Dio _dio;

  CondicionVehiculoDatasourceImpl()
      : _dio = Dio(BaseOptions(
            baseUrl: dotenv.env['API_URL'] ?? 'http://localhost:3000')) {
    _dio.interceptors.add(AuthorizeInterceptor());
  }

  @override
  Future<List<CondicionVehiculo>> getAllCondicionVehiculo() async {
    final response = await _dio.get('GetAllCondicionVehiculo');

    if (response.statusCode == 200) {
      List<dynamic> jsonList = response.data;
      return jsonList.map((json) => CondicionVehiculo.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load Condicion Vehiculo');
    }
  }
}
