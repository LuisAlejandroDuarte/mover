import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../domain/domain.dart';
import '../../utils/authorize_interceptor.dart';

class EmpresaDatasourceImpl extends EmpresaDatasource {
  final Dio _dio;

  EmpresaDatasourceImpl()
      : _dio = Dio(BaseOptions(
            baseUrl: dotenv.env['API_URL'] ?? 'http://localhost:3000')) {
    _dio.interceptors.add(AuthorizeInterceptor());
  }

  @override
  Future<Empresa> crearEmpresa(Empresa empresa) async {
    try {
      final empresaJson = empresa.toJson();
      final response = await _dio.post('CrearEmpresa', data: empresaJson);

      if (response.statusCode == 200) {
        return Empresa.fromJson(response.data);
      } else {
        final errorMessage = response.data['Message'] ?? 'Unknown error';
        throw Exception(errorMessage);
      }
    } on DioException catch (dioError) {
      // Manejo del DioError
      throw Exception(dioError.response?.data['message'] ?? 'Unknown error');
    } catch (e) {
      // Si necesitas propagar el error sin modificarlo, usa rethrow
      rethrow;
    }
  }
}
