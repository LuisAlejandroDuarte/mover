import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../domain/domain.dart';
import '../../utils/authorize_interceptor.dart';

class EstadoVehiculoDatasourceImpl extends EstadoVehiculoDatasource {
  final Dio _dio;

  EstadoVehiculoDatasourceImpl()
      : _dio = Dio(BaseOptions(
            baseUrl: dotenv.env['API_URL'] ?? 'http://localhost:3000')) {
    _dio.interceptors.add(AuthorizeInterceptor());
  }

  @override
  Future<List<EstadoVehiculo>> getAllEstadoVehiculo() async {
    final response = await _dio.get('GetAllEstadoVehiculo');

    if (response.statusCode == 200) {
      List<dynamic> jsonList = response.data;
      return jsonList.map((json) => EstadoVehiculo.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load Estado Vehiculo');
    }
  }
}
