import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import 'error_messages.dart';

class ErrorHandler {
  static final Logger _logger = Logger();

  static void handleError(Object error, BuildContext context) {
    String userFriendlyMessage =
        'Something went wrong. Please try again later.';

    if (error is DioException) {
      // Manejo de errores de Dio
      if (error.response != null) {
        final statusCode = error.response?.statusCode;
        final errorMessage = error.response?.data['message'] ?? 'Unknown error';

        switch (statusCode) {
          case 400:
            _logger.e('Error 400: $errorMessage');
            break;
          case 401:
            _logger.e('Error 401: $errorMessage');
            break;
          case 404:
            _logger.e('Error 404: $errorMessage');
            break;
          case 409:
            _logger.e('Error 409: $errorMessage');
            if (errorMessage == 'identificationalreadyexists') {
              userFriendlyMessage = 'The identifier already exists';
            }
            break;
          default:
            _logger.e('Error $statusCode: $errorMessage');
        }

        _showErrorSnackbar(context, userFriendlyMessage);
      } else {
        _logger.e('No response from server: ${error.message}');
        _showErrorSnackbar(context, userFriendlyMessage);
      }
    } else if (error is Exception) {
      // Manejo de errores genéricos
      final errorMessage = error.toString();
      _logger.e('Generic error: $errorMessage');

      userFriendlyMessage = ErrorMessages.getMessage(errorMessage);

      _showErrorSnackbar(context, userFriendlyMessage);
    } else {
      // Otros tipos de errores (por si acaso)
      _logger.e('Unknown error type: ${error.toString()}');
      _showErrorSnackbar(context, userFriendlyMessage);
    }
  }

  static void _showErrorSnackbar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: Colors.red,
      action: SnackBarAction(
        label: 'Dismiss',
        onPressed: () {
          // Acciones adicionales si es necesario
        },
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
