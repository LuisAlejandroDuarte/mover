import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../../domain/domain.dart';
import '../../../utils/authorize_interceptor.dart';

class DepartamentoDatasourceImpl extends DepartamentoDatasource {
  final Dio _dio;

  DepartamentoDatasourceImpl()
      : _dio = Dio(BaseOptions(
            baseUrl: dotenv.env['API_URL'] ?? 'http://localhost:3000')) {
    _dio.interceptors.add(AuthorizeInterceptor());
  }

  @override
  Future<List<Departamento>> getDepartamentoByIdPais(int paisId) async {
    final response = await _dio
        .get('GetDepartamentoByIdPais', queryParameters: {'paisId': paisId});

    if (response.statusCode == 200) {
      List<dynamic> jsonList = response.data;
      return jsonList.map((json) => Departamento.fromJson(json)).toList();
    } else {
      throw Exception('Error al traer la lista de Departamentos');
    }
  }
}
