class User {
  final int id;
  final String nombre;
  final String apellido;
  final String identificacion;
  final String direccion;
  final String telefono;
  final String email;
  final String userName;
  final String token;
  final String password;
  final int? tipoUserId;
  final int tipoIdentificacionId;
  final DateTime? ultimaSesion;
  final int estadoUsuarioId;

  User(
      {this.id = 0,
      required this.nombre,
      required this.apellido,
      required this.identificacion,
      required this.direccion,
      required this.telefono,
      required this.email,
      required this.userName,
      this.token = "",
      this.password = "",
      this.tipoUserId,
      required this.tipoIdentificacionId,
      this.ultimaSesion,
      required this.estadoUsuarioId});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      nombre: json['nombre'],
      apellido: json['apellido'],
      identificacion: json['identificacion'],
      direccion: json['direccion'],
      telefono: json['telefono'],
      email: json['email'],
      userName: json['userName'],
      password: json['password'],
      token: json['token'],
      tipoUserId: json['tipoUserId'],
      tipoIdentificacionId: json['tipoIdentificacionId'],
      estadoUsuarioId: json['estadoUsuarioId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nombre': nombre,
      'apellido': apellido,
      'identificacion': identificacion,
      'direccion': direccion,
      'telefono': telefono,
      'email': email,
      'userName': userName,
      'token': token,
      'password': password,
      'tipoUserId': tipoUserId,
      'tipoIdentificacionId': tipoIdentificacionId,
      'ultimaSesion': ultimaSesion
          ?.toIso8601String(), // Convertir DateTime a cadena ISO 8601
      'estadoUsuarioId': estadoUsuarioId,
    };
  }
}
