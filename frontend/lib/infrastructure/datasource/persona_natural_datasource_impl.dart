import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../domain/domain.dart';
import '../../utils/authorize_interceptor.dart';

class PersonaNaturalDatasourceImpl extends PersonaNaturalDatasource {
  final Dio _dio;
  PersonaNaturalDatasourceImpl()
      : _dio = Dio(BaseOptions(
            baseUrl: dotenv.env['API_URL'] ?? 'http://localhost:3000')) {
    _dio.interceptors.add(AuthorizeInterceptor());
  }

  @override
  Future<PersonaNatural> crearPersonaNatural(
      PersonaNatural personaNatural) async {
    try {
      final personaNaturalJson = personaNatural.toJson();
      final response =
          await _dio.post('CrearPersonaNatural', data: personaNaturalJson);

      if (response.statusCode == 200) {
        return PersonaNatural.fromJson(response.data);
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
