class PersonaNatural {
  final int? id;
  final int? userId;
  final String nombre;
  final String apellido;
  final String direccion;
  final String telefono;
  final String email;
  final int? tipoIdentificacionId;
  final String identificacion;

  PersonaNatural({
    this.id = 0,
    this.userId = 0,
    this.nombre = "",
    this.apellido = "",
    this.direccion = "",
    this.telefono = "",
    this.email = "",
    this.tipoIdentificacionId,
    this.identificacion = "",
  });

  /// Método para convertir JSON en un objeto `Persona`
  factory PersonaNatural.fromJson(Map<String, dynamic> json) {
    return PersonaNatural(
      id: json['id'],
      userId: json['userId'],
      nombre: json['nombre'] ?? "",
      apellido: json['apellido'] ?? "",
      direccion: json['direccion'] ?? "",
      telefono: json['telefono'] ?? "",
      email: json['email'] ?? "",
      tipoIdentificacionId: json['tipoIdentificacionId'],
      identificacion: json['identificacion'] ?? "",
    );
  }

  /// Método para convertir un objeto `Persona` a JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'nombre': nombre,
      'apellido': apellido,
      'direccion': direccion,
      'telefono': telefono,
      'email': email,
      'tipoIdentificacionId': tipoIdentificacionId,
      'identificacion': identificacion,
    };
  }
}
