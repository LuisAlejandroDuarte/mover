import 'package:dio/dio.dart';
import 'authorize_interceptor.dart';

class DioClient {
  final Dio _dio;

  DioClient() : _dio = Dio() {
    _dio.interceptors.add(AuthorizeInterceptor());
  }

  Dio get dio => _dio;
}
