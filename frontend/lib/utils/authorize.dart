import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'authorize_interceptor.dart';
import 'storage/token_storage.dart';

class Authorize {
  final Dio _dio = Dio();
  final TokenStorage _tokenStorage = TokenStorage();

  Authorize() {
    final apiBaseUrl = dotenv.env['API_URL'];
    if (apiBaseUrl == null) {
      throw Exception("API_BASE_URL no está configurado en el archivo .env");
    }
    _dio.options.baseUrl = apiBaseUrl;
    _dio.interceptors.add(AuthorizeInterceptor());
  }

  Future<void> fetchAndStoreToken() async {
    try {
      final response = await _dio.post('Auth/token');
      if (response.statusCode == 200) {
        String token = response.data['token'];
        await _tokenStorage.saveToken(token);
        print('Token saved: $token');
      } else {
        print('Failed to fetch token: ${response.statusMessage}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
