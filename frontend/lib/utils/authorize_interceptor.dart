import 'package:dio/dio.dart';
import 'storage/token_storage.dart';

class AuthorizeInterceptor extends InterceptorsWrapper {
  final TokenStorage _tokenStorage = TokenStorage();

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    String? token = await _tokenStorage.getToken();
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    print('Request URL: ${options.baseUrl}${options.path}');
    return handler.next(options);
  }

  @override
  void onError(DioException error, ErrorInterceptorHandler handler) {
    // Maneja el error y registra más información
    print('Error during request: ${error.message}');
    print('Response data: ${error.response?.data}');
    print('Response status: ${error.response?.statusCode}');
    return handler.next(error);
  }
}
