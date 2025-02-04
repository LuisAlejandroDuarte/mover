class Ubicacion {
  final int? id;
  final int? ciudadId;
  final String? nombreCiudad;
  final int? departamentoId;
  final String? nombreDepartamento;
  final String? latitud;
  final String? longitud;
  final int? precision;
  final DateTime? fechaHora;
  final String? direccion;
  final int? dispositivoId;

  Ubicacion({
    this.id,
    this.ciudadId,
    this.nombreCiudad,
    this.nombreDepartamento,
    this.departamentoId,
    this.latitud,
    this.longitud,
    this.precision,
    this.fechaHora,
    this.direccion,
    this.dispositivoId,
  });

  Ubicacion copyWith({
    int? id,
    int? ciudadId,
    String? nombreCiudad,
    int? departamentoId,
    String? nombreDepartamento,
    String? latitud,
    String? longitud,
    int? precision,
    DateTime? fechaHora,
    String? direccion,
    int? dispositivoId,
  }) {
    return Ubicacion(
        id: id ?? this.id,
        ciudadId: ciudadId ?? this.ciudadId,
        departamentoId: departamentoId ?? this.departamentoId,
        direccion: direccion ?? this.direccion,
        dispositivoId: dispositivoId ?? this.dispositivoId,
        fechaHora: fechaHora ?? this.fechaHora,
        latitud: latitud ?? this.latitud,
        longitud: longitud ?? this.longitud,
        nombreCiudad: nombreCiudad ?? this.nombreCiudad,
        nombreDepartamento: nombreDepartamento ?? this.nombreDepartamento,
        precision: precision ?? this.precision);
  }

  // Método para crear una instancia desde un JSON
  factory Ubicacion.fromJson(Map<String, dynamic> json) {
    return Ubicacion(
      id: json['Id'],
      ciudadId: json['ciudadId'],
      nombreCiudad: json['nombreCiudad'],
      nombreDepartamento: json['nombreDepartamento'],
      departamentoId: json['departamentoId'],
      latitud: json['Latitud'],
      longitud: json['Longitud'],
      precision: json['Precision'],
      fechaHora:
          json['FechaHora'] != null ? DateTime.parse(json['FechaHora']) : null,
      direccion: json['Direccion'],
      dispositivoId: json['DispositivoId'],
    );
  }

  // Método para convertir la instancia a JSON
  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'ciudadId': ciudadId,
      'nombreCiudad': nombreCiudad,
      'departamentoId': departamentoId,
      'nombreDepartamento': nombreDepartamento,
      'Latitud': latitud,
      'Longitud': longitud,
      'Precision': precision,
      'FechaHora': fechaHora?.toIso8601String(),
      'Direccion': direccion,
      'DispositivoId': dispositivoId,
    };
  }
}
