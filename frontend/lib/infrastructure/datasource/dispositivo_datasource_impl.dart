import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../domain/domain.dart';
import '../../utils/authorize_interceptor.dart';

class DispositivoDatasourceImpl extends DispositivosDataSource {
  final Dio _dio;

  DispositivoDatasourceImpl()
      : _dio = Dio(BaseOptions(
            baseUrl: dotenv.env['API_URL'] ?? 'http://localhost:3000')) {
    _dio.interceptors.add(AuthorizeInterceptor());
  }

  @override
  Future<int> addDispositivo(Dispositivos dispositivos) async {
    try {
      final dispositivoJson = dispositivos.toJson();
      final response =
          await _dio.post('CrearDispositivo', data: dispositivoJson);

      if (response.statusCode == 200) {
        return response.data;
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

  @override
  Future<Dispositivos> getDispositivo(String token) async {
    try {
      final response = await _dio
          .get('GetByTokenDispositivo', queryParameters: {'token': token});

      if (response.statusCode == 200) {
        return Dispositivos.fromJson(response.data);
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

  @override
  Future<Dispositivos> getDispositivoByDeviceId(String deviceId) async {
    try {
      final response = await _dio.get('GetByDeviceIdDispositivo',
          queryParameters: {'deviceId': deviceId});

      if (response.statusCode == 200) {
        return Dispositivos.fromJson(response.data);
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
