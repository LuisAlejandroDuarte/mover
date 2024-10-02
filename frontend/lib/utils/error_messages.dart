class ErrorMessages {
  static final Map<String, String> messages = {
    'emailalreadyexists': 'The email already exists',
    'usernotfound': 'User not found',
    'passwordincorrect': 'The password is incorrect',
    // Agrega más errores según sea necesario
  };

  // Método para obtener un mensaje amigable
  static String getMessage(String errorMessage) {
    for (var key in messages.keys) {
      if (errorMessage.contains(key)) {
        return messages[key]!;
      }
    }
    return 'Unknown error'; // Mensaje por defecto si no hay coincidencias
  }
}
