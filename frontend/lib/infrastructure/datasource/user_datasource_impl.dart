import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../domain/domain.dart';
import '../../utils/authorize_interceptor.dart';

class UserDataSourceImpl implements UserDataSource {
  final Dio _dio;

  UserDataSourceImpl()
      : _dio = Dio(BaseOptions(
          baseUrl: dotenv.env['API_URL'] ?? 'http://localhost:3000',
          contentType: 'application/json',
          validateStatus: (status) {
            // Acepta todos los códigos de estado entre 200 y 500.
            return status! < 500;
          }, // Configura el Content-Type globalmente
        )) {
    _dio.interceptors.add(AuthorizeInterceptor());
  }

  @override
  Future<User> addUser(User user) async {
    try {
      final userJson = user.toJson();
      final response = await _dio.post('CrearUser', data: userJson);

      if (response.statusCode == 200) {
        return User.fromJson(response.data);
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
  Future<List<User>> getUsers() {
    // TODO: implement getUsers
    throw UnimplementedError();
  }

  @override
  Future<User> getById(int id) async {
    try {
      final response =
          await _dio.get('GetUserById', queryParameters: {'id': id});

      if (response.statusCode == 200) {
        return User.fromJson(response.data);
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
