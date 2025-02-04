class ConductorAutorizado {
  final int? id;
  final int? userId;
  final String nombre;
  final String apellido;
  final String direccion;
  final String correo;
  final String identificacion;
  final int? estadoConductorAutorizadoId;

  ConductorAutorizado({
    this.id,
    this.userId,
    this.nombre = "",
    this.apellido = "",
    this.direccion = "",
    this.correo = "",
    this.identificacion = "",
    this.estadoConductorAutorizadoId,
  });

  /// Método para crear un objeto `ConductorAutorizado` desde un JSON.
  factory ConductorAutorizado.fromJson(Map<String, dynamic> json) {
    return ConductorAutorizado(
      id: json['id'],
      userId: json['userId'],
      nombre: json['nombre'] ?? "",
      apellido: json['apellido'] ?? "",
      direccion: json['direccion'] ?? "",
      correo: json['correo'] ?? "",
      identificacion: json['identificacion'] ?? "",
      estadoConductorAutorizadoId: json['estadoConductorAutorizadoId'],
    );
  }

  /// Método para convertir un objeto `ConductorAutorizado` a JSON.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'nombre': nombre,
      'apellido': apellido,
      'direccion': direccion,
      'correo': correo,
      'identificacion': identificacion,
      'estadoConductorAutorizadoId': estadoConductorAutorizadoId,
    };
  }
}
