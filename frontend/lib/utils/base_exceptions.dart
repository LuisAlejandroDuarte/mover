import 'package:dio/dio.dart';

import 'exceptions.dart';

dynamic returnResponse(Response<dynamic> response) {
  switch (response.statusCode) {
    case 200:
      return response.data;
    case 400:
      throw BadRequestException(response.data['err']['message']);
    case 401:
    case 403:
      throw UnauthorizedException(response.data['err']['message']);
    case 404:
      throw NotFoundException(response.data['err']['message']);
    case 500:
      throw InternalServerException(response.data['err']['message']);
    case 20201:
      throw InvalidInputException(response.data['err']['message']);
    default:
      throw FetchDataException(
          'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
  }
}
